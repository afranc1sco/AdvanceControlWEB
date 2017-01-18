class CreateReldaycli < ActiveRecord::Migration
  def change
    create_table :reldaycli do |t|
      t.string :CodCli
      t.string :Lunes
      t.string :Martes
      t.string :Miercoles
      t.string :Jueves
      t.string :Viernes
      t.string :Sabado
      t.string :Domingo
      t.string :RutaId
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
