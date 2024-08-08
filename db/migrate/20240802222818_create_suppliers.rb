class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string  :name, null: false
      t.string  :image
	  t.boolean :active, null: false      
      t.boolean :deleted, null: false
      t.string  :deleted_description

      t.timestamps
    end
  end
end