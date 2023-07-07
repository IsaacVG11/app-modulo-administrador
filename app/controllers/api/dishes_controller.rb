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

      if params[:dish][:image].present?
        @dish.dish_image = encode_image(params[:dish][:image])
      end

      respond_to do |format|
        if @dish.save
          format.html { redirect_to dishview_path(@dish), notice: "Dish was successfully created." }
          format.json { render 'api/dishes/show', status: :ok }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @dish.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      if params[:dish][:image].present?
        @dish.dish_image = encode_image(params[:dish][:image])
      end
      
      respond_to do |format|
        if @dish.update(dish_params)
          format.html { redirect_to dishview_path(@dish), notice: "Dish was successfully updated." }
          format.json { render 'api/dishes/show', status: :ok }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @dish.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @dish.destroy
      render 'api/dishes/show', status: :ok 
    end

    private
      def set_dish
        @dish = Dish.find(params[:id])
      end

      def dish_params
        params.require(:dish).permit(:dish_name, :description, :price, :dish_image, :dish_state, :image)
      end

      def encode_image(image)
        base64_image = Base64.encode64(image.read)
        "data:#{image.content_type};base64,#{base64_image}"
      end
  end
end