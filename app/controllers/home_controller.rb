class HomeController < ApplicationController
    before_action :authenticate_admin!

    #Obtenemos de la base de datos el administrador actualmente logueado gracias a una funcion del devise y mostramos mensaje de bienvenida
    def index
        @admin = current_admin 
        @welcome_message = "Welcome, #{@admin.full_name} Email: #{@admin.email} !" if @admin
    end  
end