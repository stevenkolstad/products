class Product < ApplicationRecord
  belongs_to :Subcat
  has_one :category, through: :subcat
end
