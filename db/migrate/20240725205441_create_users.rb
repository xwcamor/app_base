class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.references :account, null: false, foreign_key: true
      t.string :name
      t.string :lastname
      t.string :cellphone

      t.timestamps
    end
  end
end