class HomeController < ApplicationController
    before_action :authenticate_admin!

    def index
        @admin = current_admin 
        @welcome_message = "Welcome, #{@admin.full_name} Email: #{@admin.email} !" if @admin
    end  
end