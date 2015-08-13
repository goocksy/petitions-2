class CreateVotings < ActiveRecord::Migration
  def change
    create_table :votings do |t|
    	t.integer :petition_id
    	t.string :surname
    	t.string :name
    	t.string :patronymic
    	t.integer :age
    	
      t.timestamps
    end
  end
end
