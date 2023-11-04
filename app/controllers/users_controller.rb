class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confim, :image_name))
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザーの新規登録に成功しました"
      redirect_to ('/')
    else
      render "new"
    end
  end

  def account
  end

  def account_edit
  end

  def account_update
    @user = User.find_by(id: params[:id])
    if @current_user.update(params.permit(:email, :password, :password_confim))
      flash[:notice] = "アカウント情報を更新しました"
      redirect_to :users_account
    else
      render "account_edit"
    end
  end

  def profile
  end

  def profile_edit
  end

  def profile_update
    @user = User.find_by(id: params[:id])
    if @current_user.update(params.permit(:name, :image_name, :introduction))
      flash[:notice] = "プロフィール情報を更新しました"
      redirect_to :users_profile
    else
      render "profile_edit"
    end
  end

  def login_form
  end

  def login
    @user =User.find_by(email: params[:email],password: params[:password]) 
    if @user 
      session[:user_id] = @user.id
      flash[:notice] = "ログインに成功しました"
      redirect_to ('/')
    else
      render :login_form
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトに成功しました"
    redirect_to :login
  end
end
