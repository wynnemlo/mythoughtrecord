class SessionsController < ApplicationController
  def new
  end

  def create
    binding.pry
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash['noitce'] = "Welcome back!"
      redirect_to root_path
    else
      flash['error'] = "There's something wrong with your username or password."
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "See you again next time. :)"
    redirect_to root_path
  end

end