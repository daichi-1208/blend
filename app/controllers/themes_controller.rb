class ThemesController < ApplicationController

    def index
        @themes = Theme.where(is_active: true)
    end

    def show
        @theme = Theme.find(params[:id])
        @posts = Post.where(theme_id: params[:id])
    end
end
