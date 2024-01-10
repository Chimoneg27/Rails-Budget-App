class PurchasesController < ApplicationController
  def index
    @group = Group.find(params[:group_id])
    @update_purchases = @group.purchases.where(author_id: current_user.id).order(created_at: :desc)
    @total = @update_purchases.map(&:amount).sum
    @purchases = @update_purchases.to_a
  end

  def new
    @purchase = Purchase.new
    @group = Group.find(params[:group_id])
    @groups = current_user.groups.all
  end

  def create
    @purchase = current_user.purchases.new(purchase_params)
    @group = Group.find(params[:group_id])

    if @purchase.save
      GroupDetail.create(group_id: @group.id, purchase_id: @purchase.id)
      redirect_to group_purchases_path(group_id: @group.id)
    else
      render :new
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @group = Group.find(@purchase.group_id)
    @group_purchase = GroupDetail.where(purchase_id: @purchase.id)
    @group_purchase.destroy_all
    @purchase.destroy!
    redirect_to group_purchases_path(group_id: @group.id)
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, :group_id, :author_id)
  end
end
