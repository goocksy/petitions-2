class Voting < ActiveRecord::Base

	#attr_accessible :petition, :petition_id
	belongs_to :petition
	has_many :users
	validates :age, :surname, :patronymic, :name, presence: true
	validates :age,  numericality: { only_integer: true, greater_than_or_equal_to: 1}
	accepts_nested_attributes_for :users

end
