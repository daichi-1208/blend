class PostCommentsController < ApplicationController

    def create
        post = Post.find(params[:post_id])
        comment = current_user.post_comments.new(post_comment_params)
        comment.post_id = post.id
        comment.save
        redirect_to theme_post_path(params[:theme_id],params[:post_id])
    end

    def destroy
        post = Post.find(params[:post_id])
        comment = post.post_comments.find(params[:id])
        comment.destroy
        redirect_to theme_post_path(params[:theme_id],params[:post_id])
    end

    private
    def post_comment_params
        params.require(:post_comment).permit(:user_id,:post_id,:comment)
    end

end
