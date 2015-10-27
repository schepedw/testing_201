class AccountTypeFk < ActiveRecord::Migration
  def up
    add_foreign_key :accounts, :account_types
  end

  def down
    remove_foreign_key :accounts, :account_types
  end
end
