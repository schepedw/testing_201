class AddressesUsers < ActiveRecord::Migration
  def up
    create_table :addresses_users, id: false do |t|
      t.integer :address_id
      t.integer :user_id
    end

    add_index :addresses_users, :address_id
    add_index :addresses_users, :user_id
  end

  def down
    drop_table :addresses_users
  end
end
