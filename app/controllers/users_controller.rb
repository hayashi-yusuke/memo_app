class UsersController < ApplicationController
  # 認証をスキップ: サインアップ（new, create）はログイン前に行うため
  allow_unauthenticated_access only: [:new, :create] 
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # ユーザー登録成功後、index画面へリダイレクト
      redirect_to root_path, notice: "ユーザー登録が完了しました！"
    else
      # エラー時はフォームを再表示
      render :new, status: :unprocessable_entity
    end
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
      redirect_to user_path(@user),notice: "プロフィールの編集を更新しました！"
    else
      render :edit
    end
  end
  
  private
 
  def user_params
    # name, email_address, password, password_confirmation を許可
    params.require(:user).permit(:name, :avater, :email_address, :password, :password_confirmation)
  end
end