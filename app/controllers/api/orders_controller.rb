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
        render 'api/orders/show', status: :created
      else
        render json: @order.errors, status: :unprocessable_entity 
      end

      #Notificamos que ya se creó una orden al forntend
      ActionCable.server.broadcast('orders_channel', { order: @order })
    end

    #Se le agrega el respond_to format para cuando en la pagina hagamos editemos un 
    #estado de la orden y este entre a este controlador y luego lo redireccione al show de pagina web
    def update
      respond_to do |format|
        if @order.update(order_params)
          format.html { redirect_to orderview_path(@order), notice: "Order was successfully updated." }
          format.json { render 'api/orders/show', status: :ok }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @order.destroy
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
