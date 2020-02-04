class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.integer :lat
      t.integer :lon
      t.string :description
      t.string :features
      t.string :spot_type
      t.string :img
      t.integer :avg_rating
      t.timestamps
    end
  end
end
