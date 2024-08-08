class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.string     :name
      t.text       :logo
      t.text       :body_config
      t.boolean    :active 
      t.boolean    :deleted 
      t.string     :deleted_description      

      t.timestamps
    end
  end
end