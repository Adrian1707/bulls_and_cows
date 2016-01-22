class ChangeDefaultValueInUsersNotZero < ActiveRecord::Migration
  def change
    change_column_default(:users, :high_score, 100000000)
  end
end
