class Material < ApplicationRecord

    belongs_to :post, optional: true

    validates :name, presence: true
    validates :quantity, presence: true

end
