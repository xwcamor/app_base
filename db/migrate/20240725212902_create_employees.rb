class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.references :position, null: false, foreign_key: true
      t.string     :name, null: false
      t.text       :image
	    t.boolean    :active, null: false      
      t.boolean    :deleted, null: false
      t.string     :deleted_description

      t.timestamps
    end
  end
end