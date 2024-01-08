class PurchasesController < ApplicationController
  def index
    if params[:group_id]
      @group = Group.find(params[:group_id])
      @update_purchases = @group.purchases.where(author_id: current_user.id)
      @total_amount = @update_purchases.sum(:amount)
      @purchases = @update_purchases.to_a
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @purchases = @user.purchases
    end
  end

  def new
    @purchase = Purchase.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.all
  end

  def create
    group_params = params[:purchase][:group]
    name = params[:purchase][:name]
    amount = params[:purchase][:amount]

    @group = Group.find_by(name: group_params)
    @purchase = current_user.purchases.build(name:, amount:)
    @group.purchases << @purchase
    if @group.save
      redirect_to group_purchases_path(@group)
    else
      render :new
    end
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :group_id, :author_id)
  end
end
