class Product < ApplicationRecord
    validates :item, :description, :size, :price, presence: true
end
