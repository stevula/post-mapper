class SessionsController < ApplicationController
  # TODO: better error handling
  def new
    @user = User.new
  end

  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate your 
        Facebook credentials"
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session[:user_id] = nil
      flash[:success] = "Logout successful"
    end
    redirect_to root_path
  end
end
