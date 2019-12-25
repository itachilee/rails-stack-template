class CustomersController < ApplicationController

  before_action :find_customer, :authenticate_user!, only: %i[update vote destroy edit]
  def index
    @customers = Customer.all.recent.paginate(:page => params[:page], :per_page => 5)
  end

  def show; end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
   # @customer.user = current_user
    if @customer.save
      redirect_to customers_path, notice:'新增成功！'
    else
      render :new
    end
  end

  def update
    if @customer.update(customer_params)
      redirect_to customers_path, notice: '更新成功'
    else
      render :edit
    end
  end

  def vote
    @customer&.vote_logs&.create(ip_address: request.remote_ip)
    redirect_to customers_path, notice: '投票成功'
  end

  def destroy
    @customer&.destroy
    redirect_to customers_path, notice: '资料已经删除'
  end

  def edit; end

  private

  def customer_params
    params.require(:customer).permit(:name, :address, :idcard, :mobile,:remark)
  end

  def find_customer
    @customer = Customer.find_by(id: params[:id])
  end
end
