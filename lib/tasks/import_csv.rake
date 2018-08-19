namespace :import do
  desc "Import CSV File"
  task csv: :environment do
    require 'smarter_csv'
    filename = Rails.root + './lib/tasks/csv_imports/products.csv'
    options = {:key_mapping => { :downcase_header => true }}
    SmarterCSV.process(filename, options) do |hash|
      hash.each do |h|
       Category.create(name: h[:name])
       
       c = Category.where(name: h[:name.downcase]).first
       c.subcats.create(subcat_name: h[:subcat_name], subcat_id: h[:subcat_id])
       
       s = Subcat.where(subcat_name: h[:subcat_name.downcase]).first
       s.products.create(manuf_id: h[:manuf_id], manuf_description: h[:manuf_description], gage: h[:gage], price: h[:price], weight: h[:weight], length: h[:length], finish: h[:finish])
      end
    end
  end
end