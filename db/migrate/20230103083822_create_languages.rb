class CreateLanguages < ActiveRecord::Migration[7.0]
  def change
    create_table :languages do |t|
      t.string  :name
      t.string  :locale
      t.string  :flag
      t.boolean :active 
      t.boolean :deleted 
      t.string  :deleted_description      

      t.timestamps
    end
  end
end