class OrdersController < ApplicationController
  respond_to :json, :html

  def index
    @orders = Order.all
    respond_with @orders
  end

  def show
    @order = Order.find(params[:id])
    respond_with @order
  end

  def create
    respond_with do |request|
      request.json do
        order = Order.new
        order.amount = params[:order][:amount]
        order.user_id = params[:order][:user_id]
        if order.save
          render :status => 201, :json => "Order was created with #{order.id}"
        else
          render :status => 400, :json => order.errors.full_message
        end
      end
      request.html { raise 'Using HTML!'}
    end
  end
end
