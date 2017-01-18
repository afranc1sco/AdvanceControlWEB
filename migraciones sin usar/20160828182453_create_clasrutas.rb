class CreateClasrutas < ActiveRecord::Migration
  def change
    create_table :clasrutas do |t|
      t.string :IdCRutas
      t.string :Descripcion
      t.string :NivelNum

      t.timestamps null: false
    end
  end
end
