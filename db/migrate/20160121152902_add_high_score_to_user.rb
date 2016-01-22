class AddHighScoreToUser < ActiveRecord::Migration
  def change
    add_column :users, :high_score, :integer
  end
end
