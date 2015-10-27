class CreateAccounts < ActiveRecord::Migration
  def up
    create_table :accounts do |t|
      t.decimal :balance
      t.integer :account_type_id, :null => false
      t.timestamps :null => false
      t.belongs_to :user, index: true, :null => false
    end
  end

  def down
    drop_table :accounts
  end
end
