class AddNombreComercialToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas,:NombreComercial, :string
    add_column :empresasmadre,:NombreComercial, :string

    remove_column :empresas,:Calle
    remove_column :empresasmadre,:Calle

  end
end
