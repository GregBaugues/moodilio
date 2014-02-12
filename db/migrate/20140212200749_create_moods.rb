class CreateMoods < ActiveRecord::Migration
  def change
    create_table :moods do |t|
      t.integer  :user_id
      t.datetime :date
      t.timestamps
    end
  end
end
