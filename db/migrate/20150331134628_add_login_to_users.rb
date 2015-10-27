class AddLoginToUsers < ActiveRecord::Migration
  def up
    add_column :users, :login, :string
    User.all.each do |user|
      user.login = user.first_name[0] + user.last_name
      user.save!
    end
    change_column_null :users, :login, false
  end

  def down
    remove_column :users, :login
  end
end
