class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by email: params[:email]
  	if user && user.authenticate(params[:password])		
  		session[:user_id] = user.id 
  		flash[:notice] = "you are signed in!"
  		redirect_to root_url
  	else 
  		flash.now[:alert] = "Invalid email or password."
  		render 'new'
  	end
  end

  def destroy
  	session[:user_id] = nil
  	flash[:notice] = "You are now signed out!"
  	redirect_to root_url
  end

end
