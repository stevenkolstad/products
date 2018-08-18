class CreateSubcats < ActiveRecord::Migration[5.2]
  def change
    create_table :subcats do |t|
      t.string :subcat_name
      t.integer :subcat_id
      t.references :category, foreign_key: true

      t.timestamps
    end
    add_index :subcats, :subcat_id
  end
end
