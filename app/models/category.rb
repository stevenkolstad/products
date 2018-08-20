class Category < ApplicationRecord
  has_many :subcats, dependent: :destroy
  has_many :products, through: :subcats
  
  validates :name, uniqueness: true
  
  mount_uploader :csv, CSVUploader
  
  before_save :import_csv
  
  def import_csv
    if self.csv.present?
      filename = Rails.root + self.csv.current_path
      options = {:key_mapping => { :downcase_header => true }}
      SmarterCSV.process(filename, options) do |hash|
        hash.each do |h|
         Category.create(name: h[:name])
         
         c = Category.where(name: h[:name.downcase]).first
         c.subcats.create(subcat_name: h[:subcat_name], subcat_id: h[:subcat_id])
         sleep 0.1
         s = Subcat.where(subcat_name: h[:subcat_name.downcase]).first
         s.products.create(manuf_id: h[:manuf_id], manuf_description: h[:manuf_description], gage: h[:gage], price: h[:price], weight: h[:weight], length: h[:length], finish: h[:finish])
        end
      end
    end
  end
end
