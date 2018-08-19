class Subcat < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :destroy
end
