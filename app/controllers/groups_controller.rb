class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @group_manager = User.find_by(id: @group.manage_id)
    @secret_groups = Group.where(:secret => true)

    @users_blogs = []
    @group.users.each do |user|
      user.blogs.each do |blog|
        @users_blogs << blog
      end
    end
    @users_blogs = Kaminari.paginate_array(@users_blogs).page(params[:page]).per(25)
  end

  def index
  end

  def new
    @group = Group.new
    @user = User.find(current_user[:id])
    @group_user = GroupUser.new
    @users = User.all

  end

  def create
  	@group = Group.new(group_params)
    @group.manage_id = current_user.id
    # @group.image = image("group_3.jpg")
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
  	params.require(:group).permit(:name, :descreption, :group_user_id, :user_id, :image, :manage_id)

  end


end
