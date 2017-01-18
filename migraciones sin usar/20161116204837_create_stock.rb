class CreateStock < ActiveRecord::Migration
  def change
    create_table :stock do |t|
      t.string :Articulo
      t.string :Stock
      t.string :Ruta
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
