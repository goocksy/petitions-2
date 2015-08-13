class Petition < ActiveRecord::Base
	has_many :votings
	accepts_nested_attributes_for :votings, reject_if: lambda {|attributes| attributes[:name].blank?}

	validates :title, :description, presence: true
	validates :vote_max, numericality: { only_integer: true , greater_than: 0}
	
end
