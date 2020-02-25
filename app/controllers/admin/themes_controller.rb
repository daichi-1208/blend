class Admin::ThemesController < ApplicationController

    before_action :authenticate_admin!

    def index
        @themes = Theme.all

    end

    def new
        @theme = Theme.new
    end

    def create
        @theme = Theme.new(theme_params)
        if @theme.save
            redirect_to admin_themes_path
        else
            render :new
        end
    end

    def show
        @theme = Theme.find(params[:id])
    end

    def edit
        @theme = Theme.find(params[:id])
    end

    def update
        @theme = Theme.find(params[:id])
        if @theme.update(theme_params)
            redirect_to admin_theme_path(@theme)
        else
            render :edit
        end
    end

    def destroy

    end

    private
        def theme_params
            params.require(:theme).permit(:name, :introduction, :is_active, :image)
        end
    
end
