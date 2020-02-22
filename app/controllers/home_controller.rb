class HomeController < ApplicationController

    def top
        #新着カクテル表示
        @new_posts = Post.all.order(created_at: :desc).limit(3)
        #カクテルランキング表示
        @post_ranks = Post.create_all_ranks
        #ユーザーランキング表示
        @user_ranks = User.create_all_ranks
        #ランダムでお題を1件表示
        @random = Theme.order("RANDOM()").limit(1)
    end
end
