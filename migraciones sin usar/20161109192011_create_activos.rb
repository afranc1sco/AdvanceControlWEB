class CreateActivos < ActiveRecord::Migration
  def change
    create_table :activos do |t|
      t.string :Descripcion
      t.string :Modelo
      t.string :Fecha
      t.string :Imagen
      t.string :Serie
      t.string :CB
      t.string :Status
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
