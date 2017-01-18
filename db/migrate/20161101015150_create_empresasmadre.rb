class CreateEmpresasmadre < ActiveRecord::Migration
  def change
    create_table :empresasmadre do |t|
      t.string :Empresa
      t.string :Telefono
      t.string :Contacto
      t.string :Email
      t.string :RFC
      t.string :Direccion
      t.string :Calle
      t.string :NoExterior
      t.string :NoInterior
      t.string :CP

      t.timestamps null: false
    end
  end
end
