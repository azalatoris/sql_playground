class CreateTicket < ActiveRecord::Migration[7.0]
  def change
    create_table :tickets do |t|
      t.references :sale, null: false, foreign_key: true
      t.references :seat, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :amount

      t.timestamps
    end
  end
end
