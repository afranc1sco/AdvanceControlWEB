class CreateClasclientes < ActiveRecord::Migration
  def change
    create_table :clasclientes do |t|
      t.string :IdClasC
      t.string :Descripcion
      t.string :NivelNum

      t.timestamps null: false
    end
  end
end
