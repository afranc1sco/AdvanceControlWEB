class CreatePerfiles < ActiveRecord::Migration
  def change
    create_table :perfiles do |t|
      t.string :Altas
      t.string :Bajas
      t.string :Modi
      t.string :Listar
      t.string :Modulo
      t.string :IdUser
      t.string :Aceso
      t.string :Codigo
      t.string :usaPW
      t.string :Otro
      t.string :Descripcion

      t.timestamps null: false
    end
  end
end
