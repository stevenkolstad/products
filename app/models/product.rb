class Product < ApplicationRecord
  belongs_to :subcat
  has_one :category, through: :subcat
end
