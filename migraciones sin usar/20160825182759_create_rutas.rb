class CreateRutas < ActiveRecord::Migration
  def change
    create_table :rutas do |t|
      t.string :Ruta
      t.string :Activa
      t.string :TipoRuta
      t.string :VenSinStock
      t.string :Oficina
      t.string :Sector
      t.string :Vendedor
      t.string :Tipo
      t.string :id_ayudante1
      t.string :id_ayudante2
      t.string :VendedorAyudante
      t.string :Foranea
      t.string :vehiculo
      t.string :idcrutas
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
