class PetitionsController < ApplicationController


  def show 
    if @petition = Petition.where(id: params[:id]).first
      render "petitions/show"
    else
      render text: "Page not found", status: 404
    end
  end

  def edit
    @petition = Petition.find(params[:id])
  end

  def update
    @petition = Petition.find(params[:id])
    if @petition.update(petition_params)
      redirect_to root_url
    else
      render "edit"
    end
  end

  def destroy
    @petition = Petition.find(params[:id])
    @petition.destroy
    redirect_to root_url
  end

	def new
		@petition = Petition.new
	end


	def create
		@petition = Petition.new(petition_params)
    #В случае если пользователь зарегистрированный
    if current_user.present?
      @petition.author_name = current_user.name
      @petition.author_surname = current_user.surname
      @petition.author_patronymic = current_user.patronymic
      @petition.author_age = current_user.age
    end

  	if @petition.save
  		redirect_to root_url
  	else
  		render 'new'
  	end
	end

private

  def petition_params
  	#стронг параметы (для того чтоб лишнего не отправляли)
  	params.require(:petition).permit(:title, :description, :vote_max, :author_surname, :author_name, :author_patronymic, :author_age )
  end


end
