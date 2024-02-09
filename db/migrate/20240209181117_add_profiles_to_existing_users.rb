class AddProfilesToExistingUsers < ActiveRecord::Migration[7.0]
  def up
    User.all.each do |user|
      Profile.create(user: user)
    end
  end

  def down
    Profile.delete_all
  end
end
