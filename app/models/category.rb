class Category < ApplicationRecord
  has_many :subcats, dependent: :destroy
  has_many :products, through: :subcats
end
