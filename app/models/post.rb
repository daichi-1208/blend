class Post < ApplicationRecord

    attachment :image
    belongs_to :user
    belongs_to :theme
    has_many :materials
    has_many :favorites
    accepts_nested_attributes_for :materials, allow_destroy: true
    acts_as_taggable


    def favorited_by?(user)
        favorites.where(user_id: user.id).exists?
    end


    
end
