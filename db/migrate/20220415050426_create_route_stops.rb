class CreateRouteStops < ActiveRecord::Migration[7.0]
  def change
    create_table :route_stops do |t|
      t.references :route, null: false, foreign_key: true
      t.references :stop, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
