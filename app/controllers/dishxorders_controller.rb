class DishxordersController < ApplicationController
  before_action :set_dishxorder, only: %i[ show edit update destroy ]

  # GET /dishxorders or /dishxorders.json
  def index
    @dishxorders = Dishxorder.all
  end

  # GET /dishxorders/1 or /dishxorders/1.json
  def show
  end

  # GET /dishxorders/new
  def new
    @dishxorder = Dishxorder.new
  end

  # GET /dishxorders/1/edit
  def edit
  end

  # POST /dishxorders or /dishxorders.json
  def create
    @dishxorder = Dishxorder.new(dishxorder_params)

    respond_to do |format|
      if @dishxorder.save
        format.html { redirect_to dishxorder_url(@dishxorder), notice: "Dishxorder was successfully created." }
        format.json { render :show, status: :created, location: @dishxorder }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @dishxorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dishxorders/1 or /dishxorders/1.json
  def update
    respond_to do |format|
      if @dishxorder.update(dishxorder_params)
        format.html { redirect_to dishxorder_url(@dishxorder), notice: "Dishxorder was successfully updated." }
        format.json { render :show, status: :ok, location: @dishxorder }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @dishxorder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dishxorders/1 or /dishxorders/1.json
  def destroy
    @dishxorder.destroy

    respond_to do |format|
      format.html { redirect_to dishxorders_url, notice: "Dishxorder was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dishxorder
      @dishxorder = Dishxorder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def dishxorder_params
      params.fetch(:dishxorder, {})
    end
end
