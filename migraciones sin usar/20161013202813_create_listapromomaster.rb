class CreateListapromomaster < ActiveRecord::Migration
  def change
    create_table :listapromomaster do |t|
      t.string :Id
      t.string :ListaMaster
      t.string :Promociones
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
