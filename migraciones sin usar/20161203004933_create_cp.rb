class CreateCp < ActiveRecord::Migration
  def change
    create_table :cp do |t|
      t.string :CP
      t.string :Colonia
      t.string :Municipio
      t.string :Estado
      t.string :Ciudad

      t.timestamps null: false
    end
  end
end
