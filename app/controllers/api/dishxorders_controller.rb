module Api
  class DishxordersController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_dishxorder, only: %i[ show edit update destroy ]
    before_action :set_orders
    before_action :set_dishes

    def index
      @dishxorders = Dishxorder.all
    end

    def show; end

    def new
      @dishxorder = Dishxorder.new
    end

    def edit; end

    def create
      @dishxorder = Dishxorder.new(dishxorder_params)

      if @dishxorder.save
        render 'api/dishxorders/show', status: :created 
      else
        render json: @dishxorder.errors, status: :unprocessable_entity 
      end
    end

    def update
      if @dishxorder.update(dishxorder_params)
        render 'api/dishxorders/show', status: :ok
      else
        render json: @dishxorder.errors, status: :unprocessable_entity 
      end
    end

    def destroy
      @dishxorder.destroy
      render 'api/dishxorders/show', status: :ok
    end

    private
      def set_dishxorder
        @dishxorder = Dishxorder.find(params[:id])
      end

      def set_orders 
        @orders = Order.all.map {|order| ["#{order.order_time} #{order.order_date} #{order.order_state}", order.id]}
      end

      def set_dishes 
        @dishes = Dish.all.map {|dish| ["#{dish.dish_name} #{dish.description} #{dish.price} #{dish.dish_image} #{dish.dish_state}", dish.id]}
      end

      def dishxorder_params
        params.require(:dishxorder).permit(:order_id, :dish_id)
      end
  end
end
