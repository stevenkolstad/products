class Product < ApplicationRecord
  belongs_to :subcat
  has_one :category, through: :subcat

  validates :manuf_id, uniqueness: true

end
