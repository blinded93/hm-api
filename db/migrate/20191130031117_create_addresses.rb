class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip_code
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
