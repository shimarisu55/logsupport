class GroupUsersController < ApplicationController
  def show
    @group = Group.find(params[:group_id])
    @groups = @group.users
    @user = @groups
    @group_user = GroupUser.find(params[user_id: user_id, group_id: @group.id])

  end

  def index
  	@users = User.all
    @group = params[:group_id]
    @q = User.ransack(params[:q])
    # @blogs =@q.result
    @users = @q.result
  end

  def create
    user_id = params[:user_id]
    group_id = params[:group_id]
    # user = User.find(params[:id])
    group_user = GroupUser.new(user_id: user_id, group_id: group_id)
    group_user.save
    redirect_to group_path(group_id)
  end

  def destroy
    group_id = params[:group_id]
    group_user_id = params[:group_user_id]
    group_user = GroupUser.find(params[group_id: group_id, group_user_id: group_user_id])
    group_user.destroy
    redirect_to group_path(group_user.group.id)
  end
end