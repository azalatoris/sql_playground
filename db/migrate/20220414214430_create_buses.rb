class CreateBuses < ActiveRecord::Migration[7.0]
  def change
    create_table :buses do |t|
      t.references :bus_model, null: false, foreign_key: true
      t.string :plate

      t.timestamps
    end
  end
end
