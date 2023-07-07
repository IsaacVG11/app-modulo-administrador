class StateviewsController < ApplicationController
  before_action :set_state, only: %i[ show edit update ]

    def index
      @states = State.all
    end

    def show; end

    def edit; end

    private
      def set_state
        @state = State.find(params[:id])
      end

      def state_params
        params.require(:state).permit(:ontime, :overtime, :late)
      end
end
