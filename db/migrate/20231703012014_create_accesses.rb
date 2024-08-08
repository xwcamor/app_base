class CreateAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :accesses do |t|
      t.string :resource_name, null: false
      t.string :action_name, null: false

      t.timestamps
    end
  end
end