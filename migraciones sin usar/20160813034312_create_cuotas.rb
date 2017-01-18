class CreateCuotas < ActiveRecord::Migration
  def change
    create_table :cuotas do |t|
      t.string :Clave
      t.string :Descripcion
      t.string :UniMed
      t.string :Cantidad
      t.datetime :FechaI
      t.datetime :FechaF
      t.string :Producto
      t.boolean :Tipo
      t.boolean :Activa
      t.integer :NivelNum
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
