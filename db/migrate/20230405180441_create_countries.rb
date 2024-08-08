class CreateCountries < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string     :name
      t.string     :currency
      t.string     :time_zone
      t.string     :region
      t.references :language, null: false, foreign_key: true
      t.boolean    :active 
      t.boolean    :deleted 
      t.string     :deleted_description      

      t.timestamps
    end
  end
end
