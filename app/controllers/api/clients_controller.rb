module Api
  class ClientsController < ApplicationController
    skip_before_action :verify_authenticity_token
    before_action :set_client, only: %i[show edit update destroy]

    def index
      @clients = Client.all
    end

    def show; end

    def new
      @client = Client.new
    end

    def edit; end

    def create
      @client = Client.new(client_params)

      if @client.save
        render 'api/clients/show', status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end

    def update
      respond_to do |format|
        if @client.update(client_params)
          format.html { redirect_to clientview_path(@client), notice: "Client was successfully updated." }
          format.json { render 'api/clients/show', status: :ok }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @client.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @client.destroy
      render 'api/clients/show', status: :ok
    end

    def buscar_por_email
      @client = Client.find_by(email: params[:client][:email])
    
      if @client
        render 'api/clients/show', status: :ok
      else
        render json: { error: 'Cliente no encontrado' }, status: :not_found
      end
    end
    
    private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client).permit(:full_name, :address, :email, :password, :client_state)
    end
  end
end
