class CreateRelmens < ActiveRecord::Migration
  def change
    create_table :relmens do |t|
      t.string :MenId
      t.string :CodCliente
      t.string :IdCliente
      t.string :CodProducto
      t.string :IdProducto
      t.string :CodRuta
      t.string :IdRuta
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
