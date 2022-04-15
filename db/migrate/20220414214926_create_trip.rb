class CreateTrip < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.references :route, null: false, foreign_key: true
      t.references :bus, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
