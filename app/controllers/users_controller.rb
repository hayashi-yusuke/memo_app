class UsersController < ApplicationController
  allow_unauthenticated_access only: [:new, :create] 
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "ユーザー登録が完了しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to root_path, notice: "プロフィールの編集を更新しました！"
    else
      render :edit
    end
  end
  
  private
 
  def user_params
    params.require(:user).permit(:name, :avatar, :email_address, :password, :password_confirmation)
  end
end