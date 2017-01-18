class CreateListapromo < ActiveRecord::Migration
  def change
    create_table :listapromo do |t|
      t.string :Lista
      t.string :Descripcion
      t.string :Caduca
      t.string :FechaI
      t.string :FechaF
      t.string :Grupo
      t.string :Activa
      t.string :Tipo
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
