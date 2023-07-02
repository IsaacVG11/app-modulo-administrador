class HomeController < ApplicationController

    #Antes de que el usuario pueda ver el contenido de Home debe de iniciar sesión
    before_action :authenticate_admin!

    def index; end
end