class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "creating successfully"
      redirect_to user_path(@user.id)
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
  end

  def edit
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully update."
      redirect_to user_path
    else
      flash[:alert] = "Updating error."
      redirect_to user_path
    end
  end

  private

  def user_params
    params.require(:user_image).permit(:name, :introduction, :profile_image_id)
  end
end
