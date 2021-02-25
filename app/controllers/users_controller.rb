class UsersController < ApplicationController
  def index
    @users = User.all
    # タイムライン上に表示する投稿データを取得
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
  end

  def edit
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to current_user
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  # post_image_paramsでは、フォームで入力されたデータが投稿データとして許可されているパラメータかどうかをチェック
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
