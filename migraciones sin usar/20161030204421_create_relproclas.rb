class CreateRelproclas < ActiveRecord::Migration
  def change
    create_table :relproclas do |t|
      t.string :ProductoId
      t.string :ClasiF
      t.string :Nivel
      t.string :Dep_Clasif
      t.string :Dep_Nivel
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
