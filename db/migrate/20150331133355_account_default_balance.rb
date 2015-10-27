class AccountDefaultBalance < ActiveRecord::Migration
  def change
    Account.where(:balance => nil).each do |account|
      account.balance = 0.0
      account.save!
    end
    change_column :accounts, :balance, :float, :default => 0.0
  end
end
