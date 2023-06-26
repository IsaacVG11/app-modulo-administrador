class HomeController < ApplicationController

    #Antes de que el usuario pueda ver el contenido de Home debe de iniciar sesión
    before_action :authenticate_user_login!

    def index; end
end