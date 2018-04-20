class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
  	@user = User.find(params[:id])
  	@blogs = @user.blogs.all
  	@users = User.all
    @blogs = @blogs.page(params[:page]).per(12).order(:id)
  end

  def edit
  	@user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def new
  	@blog = Blog.new
  end

  def update
      @user = User.find(params[:id])
      @user.update(user_params)
      redirect_to user_path(@user.id)
  end
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to blogs_path
  end
  private 
  def user_params
      params.require(:user).permit(:name, :image, :descreption, :tag)
  end
end
