class CreateDetallepromo < ActiveRecord::Migration
  def change
    create_table :detallepromo do |t|
      t.string :Articulo
      t.string :PromoId
      t.string :Cantidad
      t.string :Tipo
      t.string :TipoProm
      t.string :Monto
      t.string :Volumen
      t.string :TipMed
      t.string :IdEmpresa
      t.string :Nivel

      t.timestamps null: false
    end
  end
end
