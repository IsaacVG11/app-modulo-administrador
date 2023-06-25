module Api
  class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_order, only: %i[ show edit update destroy ]

    def index
      @orders = Order.all
    end

    def show; end

    def new
      @order = Order.new
    end

    def edit; end

    def create
      @order = Order.new(order_params)
    
      if @order.save
        #redirect_to order_url(@order), notice: t('Controller.created') 
        render 'api/orders/show', status: :created
      else
        #render :new, status: :unprocessable_entity 
        render json: @order.errors, status: :unprocessable_entity 
      end
    end

    def update
        if @order.update(order_params)
          #redirect_to order_url(@order), notice: t('Controller.updated') 
          render 'api/orders/show', status: :ok 
        else
          #render :edit, status: :unprocessable_entity 
          render json: @order.errors, status: :unprocessable_entity 
        end
    end

    def destroy
      @order.destroy

      #redirect_to orders_url, notice: t('Controller.destroyed') 
      render 'api/orders/show', status: :ok
    end

    private
      def set_order
        @order = Order.find(params[:id])
      end

      def order_params
        params.require(:order).permit(:order_time, :order_date, :order_state, :client_id)
      end                
    end
end
