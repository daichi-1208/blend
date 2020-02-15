class PostsController < ApplicationController

    def index

    end

    def show

    end

    def new
        @post = Post.new
        @post.materials.build
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if  post.save
            redirect_to posts_path
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
    def post_params
        params.require(:post).permit(:name, :material, :quantity, :image, :introduction, :tag_list, materials_attributes: [:name, :quantity])
    end
end
