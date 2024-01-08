class GroupsController < ApplicationController
  def index
    @groups = current_user.groups.includes(:purchases)
  end

  # I want to create a new group and save it to the database
  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :amount)
  end
end
