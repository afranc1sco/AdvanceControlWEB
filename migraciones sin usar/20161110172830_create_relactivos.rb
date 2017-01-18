class CreateRelactivos < ActiveRecord::Migration
  def change
    create_table :relactivos do |t|
      t.string :Cliente
      t.string :Activo
      t.string :FechaAsignacion
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
