class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :surname
      t.string :name
      t.string :patronymic
      t.integer :age

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
