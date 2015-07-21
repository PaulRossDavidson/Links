class SessionsController < ApplicationController

  def new
    # render plain: "new session"
  end

  def create
    # render plain: "create session"
    # render json: params
    user = User.authenticate(params[:user][:email],
      params[:user][:password])

    if user
      #correct email/pw
      session[:user_id] = user.id
      flash[:success] = 'You are now logged in.'
      redirect_to root_path
    else
      #wrong email/
      flash[:danger] = 'Invalid Email or Password.'
      # render :new
      redirect_to login_path
    end

  end

  #logout
  def destroy
    # render plain: "destroy session"
    session[:user_id] = nil
    flash[:success] = 'You are now logged out.'
    redirect_to login_path
  end

end