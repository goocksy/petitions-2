class AddUserVotinRef < ActiveRecord::Migration
  def change
  	add_column :users, :voting_id, :integer
  end
end
