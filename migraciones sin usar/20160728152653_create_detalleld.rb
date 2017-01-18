class CreateDetalleld < ActiveRecord::Migration
  def change
    create_table :detalleld do |t|
      t.integer :listaid
      t.string :articulo
      t.string :tipo
      t.string :idempresa

      t.timestamps null: false
    end
  end
end
