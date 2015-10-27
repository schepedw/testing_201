class MakeSsnNonull < ActiveRecord::Migration
  def change
    change_column_null :users, :ssn, false
  end
end
