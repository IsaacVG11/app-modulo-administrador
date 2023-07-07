class ChefviewsController < ApplicationController
  before_action :set_chef, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      @chefs = Chef.where("lower(full_name) LIKE lower(:search)", search: "%#{params[:search]}%")
    else
      @chefs = Chef.all
    end
  end

  def show; end

  def new
    @chef = Chef.new
  end

  def edit; end

  def destroy
    @chef.destroy
    redirect_to chefviews_path
  end

  private
    def set_chef
      @chef = Chef.find(params[:id])
    end

    def chef_params
      params.require(:chef).permit(:full_name, :email, :password)
    end
end
