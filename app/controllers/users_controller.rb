class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new params.require(:user).permit(:email, :password, :password_confirmation)
    if @user.save
      # sign in
      session[:user_id] = @user.id
      # redirect
      redirect_to root_path, notice: "Thanks for signing up! #secrets"
    else
      render :new
    end

  end
end
