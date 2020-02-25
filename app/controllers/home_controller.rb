class HomeController < ApplicationController

    def top
        @new_posts = Post.all.order(created_at: :desc).limit(3)
        @post_ranks = Post.create_all_ranks
        @user_ranks = User.create_all_ranks
        @random = Theme.order("RAND()").limit(1)
        # @random = Theme.order("RANDOM()").limit(1)
    end
end
