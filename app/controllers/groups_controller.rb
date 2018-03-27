class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    # @group.group_users.each do |group_user|
    #   group_user.user.name
    # end
    # @group_user = @group.group_users
    # @user = @group_user.user
    # @blogs = @user.blogs
    # @blogs = Blog.where(params[:id])
    # @blogs = @group.blog.all

  end

  def index
  end

  def new
  	@group = Group.new
  	#@groups = Group.find(params[:id])
    @user = User.find(current_user[:id])
    @group_user = GroupUser.new
    @users = User.all

  end

  def create
  	@group = Group.new(group_params)
    @group.save

    group_user = GroupUser.new
    group_user.user_id = current_user.id
    group_user.group_id = @group.id
    group_user.save

  	redirect_to new_group_path
  end
  
  def update
    group = Group.find(params[:id])
    group_user.user_id = user_id
    group_user.update
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to new_group_path
  end


  private
  def group_params
  	params.require(:group).permit(:name, :descreption, :group_user_id, :user_id, :image)

  end
  # def group_user_params
  #   params.require(:group_user).permit(:user_id, :group_id)
  # end

end
