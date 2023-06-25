module Api
  class DishesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_dish, only: %i[ show edit update destroy ]

    def index
      @dishes = Dish.all
    end

    def show; end

    def new
      @dish = Dish.new
    end

    def edit; end

    def create
      @dish = Dish.new(dish_params)
      if @dish.save
        #redirect_to dish_url(@dish), notice: t('Controller.created')
        render 'api/dishes/show', status: :created 
      else
        #render :new, status: :unprocessable_entity 
        render json: @dish.errors, status: :unprocessable_entity 
      end
    end

    def update
      if @dish.update(dish_params)
        #redirect_to dish_url(@dish), notice: t('Controller.updated') 
        render 'api/dishes/show', status: :ok
      else
        #render :edit, status: :unprocessable_entity 
        render json: @dish.errors, status: :unprocessable_entity 
      end
    end

    def destroy
      @dish.destroy
      #redirect_to dishes_url, notice: t('Controller.updated') 
      render 'api/dishes/show', status: :ok 
    end

    private
      def set_dish
        @dish = Dish.find(params[:id])
      end

      def dish_params
        params.require(:dish).permit(:dish_name, :description, :price, :dish_image, :dish_state)
      end
  end
end