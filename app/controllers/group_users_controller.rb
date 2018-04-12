class GroupUsersController < ApplicationController
  def show
    @group = Group.find(params[:group_id])
    @groups = @group.users
    @user = @groups
    @group_user = GroupUser.find(params[user_id: user_id, group_id: @group.id])

  end

  def index
  	@users = User.all
    @group = Group.find(params[:group_id])
    # @q = GroupUser.search
  end

  def create
    user_id = params[:user_id]
    group_id = params[:group_id]
    group_user = GroupUser.new(user_id: user_id, group_id: group_id)
    group_user.save
    redirect_to group_path(group_id)
  end

  def destroy
    group_user = GroupUser.find_by(user_id: params[:id], group_id: params[:group_id])
    group_user.destroy
    redirect_to group_path(group_user.group.id)
  end

  # def search
  #   @group_users = User.where(params[name: user.name, group_id: @group.id])
  # end

  private
  def search_params
    params.require(:q).permit(:name_cont)
  end
end