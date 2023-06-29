class ClientviewsController < ApplicationController
  before_action :set_client, only: %i[show update]

  def index
    @clients = Client.all
  end

  def show; end
  
  #Arreglar esta funcion de update para que el estado del cliente se actualice si presiona el boton en index.
  def update
    if @client.client_state == 'disable'
      @client.update(client_state: 1)
    elsif @client.client_state == 'enable'
      @client.update(client_state: 0)
    end
    redirect_to clientview_path(@client)
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end
end




