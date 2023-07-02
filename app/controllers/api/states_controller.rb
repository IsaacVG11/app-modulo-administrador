module Api
  class StatesController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_state, only: %i[ show edit update ]

    def index
      @states = State.all
    end

    def show; end

    def new
      @state = State.new
    end

    def edit; end

    #El solamente se va a utilizar para el postman para ingresar los estado iniciales
    def create
      @state = State.new(state_params)
      if @state.save
        render 'api/states/show', status: :created 
      else
        render json: @state.errors, status: :unprocessable_entity 
      end
    end

    # Hay que dejarlo con el respond_to para cuando actualice los minutos de un estado 
    # y luego cambiar la redireccion al show del controlador de web
    def update
      respond_to do |format|
        if @state.update(state_params)
          format.html { redirect_to stateview_path(@state), notice: "State was successfully updated." }
          format.json { render 'api/states/show', status: :ok }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @state.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      def set_state
        @state = State.find(params[:id])
      end

      def state_params
        params.require(:state).permit(:ontime, :overtime, :late)
      end
  end
end