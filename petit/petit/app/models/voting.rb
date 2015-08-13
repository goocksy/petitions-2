class Voting < ActiveRecord::Base

	#attr_accessible :petition, :petition_id
	belongs_to :petition
end
