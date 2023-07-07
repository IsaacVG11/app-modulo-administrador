class DishviewsController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    if params[:search]
      @dishes = Dish.where("lower(dish_name) LIKE lower(:search) OR lower(description) LIKE lower(:search)", search: "%#{params[:search]}%")
    else
      @dishes = Dish.all
    end
  end
  
  def show; end

  def new
    @dish = Dish.new
  end

  def edit; end

  def destroy
    @dish.destroy
    redirect_to dishviews_path, notice: "Dish was successfully destroyed."
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:dish_name, :description, :price, :dish_image, :dish_state)
  end
end

