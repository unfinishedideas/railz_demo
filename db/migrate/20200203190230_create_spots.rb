class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.float :lat
      t.float :lon
      t.string :description
      t.string :features
      t.string :spot_type
      t.timestamps
    end
  end
end
