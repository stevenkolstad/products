class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :subcat, foreign_key: true
      t.string :manuf_id
      t.string :manuf_description
      t.string :gage
      t.string :price
      t.string :weight
      t.string :length
      t.string :finish

      t.timestamps
    end
  end
end
