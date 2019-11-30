class CreateExpenses < ActiveRecord::Migration[6.0]
  def change
    create_table :expenses do |t|
      t.string :payee
      t.decimal :amount, precision: 8, scale: 2
      t.integer :account_number
      t.boolean :recurring?
      t.string :url
      t.boolean :paid?
      t.string :category
      t.date :due_date
      t.references :property, null: false, foreign_key: true
      t.string :name
      t.string :frequency

      t.timestamps
    end
  end
end
