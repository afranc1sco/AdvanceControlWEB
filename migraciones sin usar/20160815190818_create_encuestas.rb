class CreateEncuestas < ActiveRecord::Migration
  def change
    create_table :encuestas do |t|
      t.string :Clave_Enc
      t.string :Desc_Enc
      t.string :Tipo_Enc
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
