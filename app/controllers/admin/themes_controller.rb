class Admin::ThemesController < ApplicationController

    def index

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

    def edit

    end

    def update

    end

    def destroy

    end

    private
        def theme_params
            perams.requre(:theme).permit(:name, :introduction, :is_active, :image)
        end
    
end
