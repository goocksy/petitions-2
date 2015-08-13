class CreatePetitions < ActiveRecord::Migration
  def change
    create_table :petitions do |t|
      t.string :title
      t.text :description
      t.integer :votes
      t.integer :vote_max
      t.string :author_surname
      t.string :author_name
      t.string :author_patronymic
      t.integer :author_age

      t.timestamps
    end
  end
end
