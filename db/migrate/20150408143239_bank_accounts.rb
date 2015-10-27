class BankAccounts < ActiveRecord::Migration
  def up
    add_column :accounts, :bank_id, :integer
    add_foreign_key :accounts, :banks
  end

  def down
    remove_foreign_key :accounts, :banks
    remove_column :accounts, :bank_id
  end
end
