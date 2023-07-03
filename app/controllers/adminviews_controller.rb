class AdminviewsController < ApplicationController
    before_action :authenticate_admin!
    before_action :set_admin, only: %i[ show edit update destroy ]

  def index
    if params[:search]
      @admins = Admin.where("full_name LIKE :search", search: "%#{params[:search]}%")
    else
      @admins = Admin.all
    end
  end

  def show; end

  def new
    @admin = Admin.new
  end

  def edit; end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to adminview_path(@admin), notice: 'Administrador creado exitosamente.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @admin.update(admin_params)
      redirect_to adminview_path(@admin), notice: 'Administrador actualizado exitosamente.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @admin.destroy
    redirect_to adminviews_path, notice: 'Administrador eliminado exitosamente.'
  end

  private

  def set_admin
    @admin = Admin.find(params[:id])
  end

  def admin_params
    params.require(:admin).permit(:full_name, :email, :encrypted_password)
  end
end
