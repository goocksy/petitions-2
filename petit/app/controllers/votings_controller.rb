class VotingsController < ApplicationController

  def index
    @votings = Voting.where(petition_id: params[:petition_id])
  end

	def new
    @petition = Petition.find(params[:petition_id])
    @voting = @petition.votings.build
	end

	def create
    @voting = Petition.find(params[:petition_id]).votings.build(voting_params)
    @votings = Voting.where(petition_id: params[:petition_id])
    if current_user.present?
      unless @votings.where(surname: current_user.surname, name: current_user.name, patronymic: current_user.patronymic, age: current_user.age).present?
        @voting.users << current_user
        @voting.name = @voting.users.last.name
        @voting.surname = @voting.users.last.surname
        @voting.patronymic = @voting.users.last.patronymic
        @voting.age = @voting.users.last.age
        @voting.save
        redirect_to petition_votings_url
      else
        flash[:notice] = "a user already voted"
        redirect_to :back       
      end
    else
      unless @votings.where(surname: params[:voting][:surname], name: params[:voting][:name], patronymic: params[:voting][:patronymic], age: params[:voting][:age]).present?
        if @voting.save
          redirect_to petition_votings_url
          flash[:notice] = "Thank you for supporting this petition"
        else
          flash[:notice] = "Something went wrong Please try again"
          redirect_to :back 
        end
      else        
        flash[:notice] = "a user already voted"
        redirect_to :back       
      end
    end
  end


  private

    def voting_params
      params.require(:voting).permit(:name, :surname, :patronymic, :age)
    end
end
