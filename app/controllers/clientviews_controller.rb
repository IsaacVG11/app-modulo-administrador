class ClientviewsController < ApplicationController
  before_action :set_client, only: %i[show edit update]

  def index
    @clients = Client.all
  end

  def show; end

  def edit; end
  
  def update
    if @client.update(client_params)
      redirect_to clientview_path(@client)
    else
      render :edit, status: :unprocessable_entity
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




