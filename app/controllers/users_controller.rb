class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confim))
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/")
    else
      render "new"
    end
  end

  def profile
  end

  def edit
  end

  def update
  end

  

  def login_form
  end
end
