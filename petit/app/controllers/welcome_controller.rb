class WelcomeController < ApplicationController

	def index
		@users = User.all
		@petitions = Petition.all
	end
	
end

