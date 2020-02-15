class PostsController < ApplicationController

    def show
        @post = Post.find(params[:id])
    end

    def new
        @theme = Theme.find(params[:theme_id])
        @post = Post.new
        @post.materials.build
    end

    def create
        @post = current_user.posts.new(post_params)
        @post.theme_id = params[:theme_id]
        if  @post.save!
            redirect_to theme_path(params[:theme_id])
            else
            @theme = Theme.find(params[:theme_id])
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
    def post_params
        params.require(:post).permit(:name, :image, :introduction, :tag_list, materials_attributes: [:name, :quantity])
    end
end
