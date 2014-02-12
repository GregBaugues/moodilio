class AddScoreToMoods < ActiveRecord::Migration
  def change
    add_column :moods, :score, :integer
  end
end
