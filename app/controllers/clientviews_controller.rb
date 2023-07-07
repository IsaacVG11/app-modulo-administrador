class ClientviewsController < ApplicationController
  before_action :set_client, only: %i[show edit update]

  def index
    @clients = Client.all
  end

  def show; end

  def edit; end
  
  
  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:full_name, :address, :email, :password, :client_state)
  end
end




