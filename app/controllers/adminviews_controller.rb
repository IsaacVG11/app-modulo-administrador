class AdminviewsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_admin, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      @admins = Admin.where("lower(full_name) LIKE lower(:search)", search: "%#{params[:search]}%")
    else
      @admins = Admin.all
    end
  end

  def show; end

  def new
    @admin = Admin.new
  end

  def edit; end

  def update
    if @admin.update(admin_params)
      redirect_to adminview_path(@admin), notice: 'Manager was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin.destroy
    redirect_to adminviews_path
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:full_name, :email, :encrypted_password)
  end
end
