class CreateMensajes < ActiveRecord::Migration
  def change
    create_table :mensajes do |t|
      t.string :Clave
      t.string :EnBaseA
      t.string :Descripcion
      t.string :Mensaje
      t.string :FechaInicio
      t.string :FechaFinal
      t.boolean :Estado
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
