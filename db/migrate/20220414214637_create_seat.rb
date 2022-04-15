class CreateSeat < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.references :bus_model, null: false, foreign_key: true
      t.string :label
      t.integer :order

      t.timestamps
    end
  end
end
