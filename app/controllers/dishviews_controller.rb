class DishviewsController < ApplicationController
  before_action :set_dish, only: %i[show edit update destroy]

  def index
    if params[:search]
      @dishes = Dish.where("dish_name LIKE :search OR description LIKE :search", search: "%#{params[:search]}%")
    else
      @dishes = Dish.all
    end
  end
  
  def show; end

  def new
    @dish = Dish.new
  end

  def edit; end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      redirect_to dishview_path(@dish), notice: "Dish was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end
  

  def update
    if @dish.update(dish_params)
      redirect_to dishview_path(@dish), notice: "Dish was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishviews_path, notice: "Dish was successfully destroyed."
  end

  private

  def set_dish
    @dish = Dish.find(params[:id])
  end

  def dish_params
    params.require(:dish).permit(:dish_name, :description, :price, :dish_image, :dish_state, :image)
  end
end

