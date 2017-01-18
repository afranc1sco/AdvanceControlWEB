class CreateDetallelp < ActiveRecord::Migration
  def change
    create_table :detallelp do |t|
      t.string :listaid
      t.string :articulo
      t.string :preciomin
      t.string :preciomax
      t.string :idempresa

      t.timestamps null: false
    end
  end
end
