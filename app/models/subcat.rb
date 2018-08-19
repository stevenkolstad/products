class Subcat < ApplicationRecord
  belongs_to :category
  has_many :products, dependent: :destroy
  
  validates :subcat_name, uniqueness: true
end
