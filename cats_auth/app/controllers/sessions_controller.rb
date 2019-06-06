class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    # render json: params
    @user = User.find_by_credentials(params[:user][:user_name],params[:user][:password])
    session[:session_token] = @user.reset_session_token!
    if @user
      # login(@user)
      redirect_to cats_url
    else
      flash[:errors] = ["Invalid credentials"]
      redirect_to new_session_url
    end
    
  end

  def destroy
    if current_user 
      logout
      
      redirect_to new_session_url
    end

  end

end
