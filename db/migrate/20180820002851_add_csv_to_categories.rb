class AddCsvToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :csv, :string
  end
end
