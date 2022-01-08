class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "creating successfully"
      redirect_to user_path(id:current_user)
    else
      @users = User.all
      render :index
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @book = @user.books
    render 'books/show'
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
