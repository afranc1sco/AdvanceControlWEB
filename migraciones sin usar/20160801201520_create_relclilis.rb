class CreateRelclilis < ActiveRecord::Migration
  def change
    create_table :relclilis do |t|
      t.string :codcliente
      t.string :listap
      t.string :listad
      t.string :listapromo
      t.string :idempresa

      t.timestamps null: false
    end
  end
end
