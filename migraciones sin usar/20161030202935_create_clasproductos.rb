class CreateClasproductos < ActiveRecord::Migration
  def change
    create_table :clasproductos do |t|
      t.string :Descripcion
      t.string :NivelNum
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
