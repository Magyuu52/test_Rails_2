class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confim, :image_name))
    if @user.save
      session[:user_id] = @user.id
      redirect_to ('/')
    else
      render "new"
    end
  end

  def profile
  end

  def edit
  end

  def update
    @user = User.find_by(id: params[:id])
    if @current_user.update(params.permit(:name, :image_name, :introduction))
      redirect_to :users_account
    else
      render "edit"
    end
  end

  def login_form
  end

  def login
    @user =User.find_by(email: params[:email],password: params[:password]) 
    if @user 
      session[:user_id] = @user.id
      redirect_to ('/')
    else
      render :login
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :login
  end
end
