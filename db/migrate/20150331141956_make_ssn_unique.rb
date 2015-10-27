class MakeSsnUnique < ActiveRecord::Migration
  def change
    add_index :users, :ssn, unique: true
  end
end
