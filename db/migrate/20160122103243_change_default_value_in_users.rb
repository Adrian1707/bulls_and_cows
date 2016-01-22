class ChangeDefaultValueInUsers < ActiveRecord::Migration
  def change
    change_column_default(:users, :high_score, 0)
  end
end
