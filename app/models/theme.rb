class Theme < ApplicationRecord

    attachment :image

    has_many :posts
    
end
