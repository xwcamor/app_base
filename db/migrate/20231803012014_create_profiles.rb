class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string  :name
      t.string  :description
      t.boolean :active 
      t.boolean :deleted 
      t.string  :deleted_description

      t.timestamps
    end
  end
end