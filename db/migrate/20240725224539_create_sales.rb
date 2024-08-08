class CreateSales < ActiveRecord::Migration[7.0]
  def change
    create_table :sales do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.references :type_payment, null: false, foreign_key: true
      t.references :report_payment, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true
      t.boolean    :active, null: false
      t.boolean    :deleted, null: false
      t.string     :deleted_description
      t.string     :cancel_description

      t.timestamps
    end
  end
end