class CreateReviews < ActiveRecord::Migration[5.2]
      def change
    create_table :reviews do |t|
      t.float :rating
      t.string :title
      t.string :content
      t.float :heat_lvl
      t.integer :user_id
      t.integer :spot_id
      t.timestamps
    end
  end
end
