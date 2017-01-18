class CreateProductoenvase < ActiveRecord::Migration
  def change
    create_table :productoenvase do |t|
      t.string :Producto
      t.string :Envase
      t.string :Cant_Base
      t.string :Cant_Eq
      t.string :Status
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
