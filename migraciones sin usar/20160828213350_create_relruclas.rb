class CreateRelruclas < ActiveRecord::Migration
  def change
    create_table :relruclas do |t|
      t.string :RutaId
      t.string :Clas1
      t.string :Clas2
      t.string :Clas3
      t.string :Clas4
      t.string :Clas5
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
