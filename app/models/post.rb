class Post < ApplicationRecord

    attachment :image

    belongs_to :user
    belongs_to :theme
    has_many :materials
    accepts_nested_attributes_for :materials

    acts_as_taggable

end
