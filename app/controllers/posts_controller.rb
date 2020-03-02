class PostsController < ApplicationController

    before_action :authenticate_user!

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
        if  @post.save
                tags = Vision.get_image_data(@post.image)
                tags.each do |tag|
                    @post.tags.create(name: tag)
                end
            redirect_to theme_path(params[:theme_id])
            else
            @theme = Theme.find(params[:theme_id])
            render :new
        end
    end

    def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to user_path(current_user)
	end

    private
    def post_params
        params.require(:post).permit(:name, :image, :introduction, materials_attributes: [:id, :name, :quantity, :_destroy])
    end
end
