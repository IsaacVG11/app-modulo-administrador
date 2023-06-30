class OrderviewsController < ApplicationController
  before_action :set_order, only: %i[ show edit update ]

  def index
    @orders = Order.all

    if params[:client_name].present?
      @orders = @orders.joins(:client).where("clients.full_name LIKE ?", "%#{params[:client_name]}%")
    end
  
    if params[:start_date].present? && params[:end_date].present?
      start_date = Date.parse(params[:start_date])
      end_date = Date.parse(params[:end_date])
      @orders = @orders.where(order_date: start_date..end_date)
    end
  
    if params[:order_time].present?
      order_time = Time.parse(params[:order_time])
      @orders = @orders.where(order_time: order_time)
    end

    if params[:order_state].present?
      @orders = @orders.where(order_state: params[:order_state])
    end
  end

  def show; end

  def edit; end

  def update
    if @order.update(order_params)
        redirect_to orderview_url(@order), notice: 'Order was successfully updated' 
    else
      render :new, status: :unprocessable_entity 
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_time, :order_date, :order_state, :client_id)
    end                
end
