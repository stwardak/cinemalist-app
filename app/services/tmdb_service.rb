require 'http'

class TmdbService
  BASE_URI = 'https://api.themoviedb.org/3/'

  def initialize
    @api_key = Rails.application.credentials.tmdb_api_key
  end

  def import_movie_ids
    genres = fetch_genres
    return unless genres

    file_path = Rails.root.join('lib', 'tmdb_imports', 'movie_ids_02_06_2024.json')
    line_count = 0
    popularity_threshold = 10

    File.foreach(file_path) do |line|
      break if line_count >= 900000
      movie_data = JSON.parse(line)
      
      next if movie_data['popularity'].to_f < popularity_threshold #only import movies with popularity score over 5

      movie_details = fetch_movie_details(movie_data['id'])

      if movie_details
        genres = movie_details['genres']
        genres = genres.map { |genre| Genre.find_or_create_by(tmdb_genre_id: genre['id'], genre: genre['name']) }
        # puts "Movie details: #{movie_details.inspect}"
        movie = Movie.find_or_initialize_by(external_id: movie_data['id'])
        movie.title = movie_details['title']
        movie.description = movie_details['overview']
        movie.popularity = movie_data['popularity']
        release_date = movie_details['release_date']
        # puts "Release date: #{release_date.inspect}" 
        movie.year = release_date[0..3] if release_date.present?
        # puts "Release date present: #{release_date}"
        movie.image_url = "https://image.tmdb.org/t/p/original#{movie_details['poster_path']}" if movie_details['poster_path']
        # puts "Image URL: #{movie.image_url}"
        movie.genres = genres
        credits = fetch_movie_credits(movie_data['id'])
        director = credits['crew'].find { |member| member['job'] == 'Director' }

        if director
          director_record = Director.find_or_create_by(name: director['name'])
          movie.director = director_record
        end

        if movie.save
          puts "external id: #{movie.external_id}, title: #{movie.title}"
        else
          puts "#{movie.errors.full_messages.join(" , ")}"
        end
      end

      line_count += 1
    end
  end

  def fetch_movie_details(movie_id)
    url = "#{BASE_URI}/movie/#{movie_id}?api_key=#{@api_key}"
    response = HTTP.get(url)
    if response.status.success?
      JSON.parse(response.body.to_s)
    else
      puts "error fetching details for movie ID: #{movie_id}"
      nil
    end
  end

  def fetch_movie_credits(movie_id)
    url = "#{BASE_URI}/movie/#{movie_id}/credits?api_key=#{@api_key}"
    response = HTTP.get(url)
    if response.status.success?
      JSON.parse(response.body.to_s)
    else
      puts "error fetching credits for movie ID: #{movie_id}"
      nil
    end
  end

  def fetch_genres
    url = "#{BASE_URI}/genre/movie/list?api_key=#{@api_key}"
    response = HTTP.get(url)
    if response.status.success?
      genre_data = JSON.parse(response.body.to_s)['genres']
      genre_data.map { |genre| [genre['id'], genre['name']] }
    else
      puts "Error fetching genres from TMDB"
      nil
    end
  end
end
