class HomeController < ApplicationController

    def top
        
        #新着カクテル表示
        @new_posts = Post.all.order(created_at: :desc).limit(6)
        #カクテルランキング表示
        @post_ranks = Post.create_all_ranks
    end
end
