class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:name],
      email: [:email],
      password: [password],
      password_confim: [password_confim],
      image_name: 'default-avatar-7a6cbfd7993e89f24bfc888f4a035a83c6f1428b8bdc47eed9095f2799a40153.png')
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
