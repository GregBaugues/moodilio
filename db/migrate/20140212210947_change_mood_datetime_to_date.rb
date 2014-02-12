class ChangeMoodDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :moods, :date, :date
  end
end
