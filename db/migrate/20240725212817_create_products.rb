class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string  :name, null: false
      t.string  :description, null: false
      t.float   :unit_price, null: false
      t.text    :image
	    t.boolean :active, null: false
      t.boolean :deleted, null: false
      t.string  :deleted_description

      t.timestamps
    end
  end
end