class ChefviewsController < ApplicationController
  before_action :set_chef, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      @chefs = Chef.where("full_name LIKE :search", search: "%#{params[:search]}%")
    else
      @chefs = Chef.all
    end
  end

  def show; end

  def new
    @chef = Chef.new
  end

  def edit; end

  def create
    @chef = Chef.new(chef_params)

    if @chef.save
      redirect_to chefview_url(@chef), notice: "Chef was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @chef.update(chef_params)
      redirect_to chefview_url(@chef), notice: "Chef was successfully updated."
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @chef.destroy
    redirect_to chefviews_path, notice: "Chef was successfully destroyed." 
  end

  private
    def set_chef
      @chef = Chef.find(params[:id])
    end

    def chef_params
      params.require(:chef).permit(:full_name, :email, :password)
    end
end
