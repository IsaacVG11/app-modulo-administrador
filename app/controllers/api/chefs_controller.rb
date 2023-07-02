module Api
  class ChefsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_chef, only: %i[ show edit update destroy ]

    def index
      @chefs = Chef.all
    end

    def show; end

    def new
      @chef = Chef.new
    end

    def edit; end

    def create
      @chef = Chef.new(chef_params)

      respond_to do |format|
        if @chef.save
          format.html { redirect_to chefviews_path(@chef), notice: "Chef was successfully created." } #Hay que redireccionar a la vista
          format.json { render 'api/chefs/show', status: :created }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @chef.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @chef.update(chef_params)
          format.html { redirect_to chefview_path(@chef), notice: "Chef was successfully updated." } #Hay que redireccionar a la vista
          format.json { render 'api/chefs/show', status: :ok }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @chef.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @chef.destroy

      respond_to do |format|
        format.html { redirect_to chefviews_path, notice: "Chef was successfully destroyed." }#Hay que redireccionar a la vista
        format.json { render 'api/chefs/show' }
      end
    end

    private
      def set_chef
        @chef = Chef.find(params[:id])
      end

      def chef_params
        params.require(:chef).permit(:full_name, :email, :password)
      end
  end
end
