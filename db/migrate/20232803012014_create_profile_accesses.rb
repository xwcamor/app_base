class CreateProfileAccesses < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_accesses do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :access,  null: false, foreign_key: true

      t.timestamps
    end
  end
end