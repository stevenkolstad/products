class Category < ApplicationRecord
  has_many :subcats
  has_many :products, through: :subcats
end
