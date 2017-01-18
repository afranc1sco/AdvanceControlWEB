class CreateRelclirutas < ActiveRecord::Migration
  def change
    create_table :relclirutas do |t|
      t.string :IdCliente
      t.string :IdRuta
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
