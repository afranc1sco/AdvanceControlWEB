class CreateSecrutas < ActiveRecord::Migration
  def change
    create_table :secrutas do |t|
      t.string :Rutad
      t.string :Lunes
      t.string :Martes
      t.string :Miercoles
      t.string :Jueves
      t.string :Viernes
      t.string :Sabado
      t.string :Domingo
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
