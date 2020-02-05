class AddUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.column  :user_name, :string
      t.column :email, :string
      t.column :password_hash, :string
      t.column :password_salt, :string
      t.timestamps
    end
  end
end
