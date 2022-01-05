class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :namae
      t.string :email
      t.timestamps
      add_index :users, :email, unique: true
    end
  end
end
