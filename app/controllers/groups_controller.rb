class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @groups = current_user.groups.includes(:purchases)
  end

  def new
    @group = Group.new
    @options = [
      ['🍔'],
      ['🛒'],
      ['🚗'],
      ['🐶'],
      ['📚'],
      ['💻'],
      ['🎁'],
      ['🏠'],
      ['🏥'],
      ['🎬'],
      ['👔'],
      ['🎓']
    ]
  end

  def create
    @group = current_user.groups.build(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  def destroy
    @group = current_user.groups.find(params[:id])
    @group.destroy
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :amount)
  end
end
