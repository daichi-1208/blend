class Post < ApplicationRecord

    attachment :image
    belongs_to :user
    belongs_to :theme
    has_many :materials, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :tags, dependent: :destroy
    accepts_nested_attributes_for :materials, allow_destroy: true

    validates :name, presence: true
    validates :introduction, presence: true

    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end

    def self.create_all_ranks #Postクラスからデータを取ってくる処理なのでクラスメソッド！
        Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
    end

end
