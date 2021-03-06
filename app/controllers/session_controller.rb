class SessionController < ApplicationController
  def create
    user = User.find_by(email: user_params[:email])

     if user && user.authenticate(user_params[:password])
       session[:current_user_id] = user.id
       flash[:message] = "Thank you for logging in"
       redirect_to application_angular_path
     else
      flash[:message] = "Email/Password combo does not exist!"
      redirect_to root_path
     end

  end

  def destroy
    session[:current_user_id] = nil

    flash[:message] = "You have successfully logged out"
    redirect_to root_path
  end

  private

    def user_params
      return params.require(:user).permit(:email, :password)
    end
  end
