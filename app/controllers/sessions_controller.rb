class SessionsController < ApplicationController
  # TODO: better error messages
  def create
    begin
      @user = User.from_omniauth(request.env['omniauth.auth'])
      login(@user)
      flash[:success] = "Welcome, #{@user.name}!"
    rescue
      flash[:warning] = "There was an error while trying to authenticate your 
        Facebook credentials"
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      logout
      flash[:success] = "Logout successful"
    end
    redirect_to root_path
  end
end
