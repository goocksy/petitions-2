class Petition < ActiveRecord::Base
	has_many :votings
	after_initialize :default_values

	validates :title, :description, presence: true
	validates :vote_max, numericality: { only_integer: true , greater_than: 0}
	
	private
		def default_values
			self.votes ||= "0"
		end
end
