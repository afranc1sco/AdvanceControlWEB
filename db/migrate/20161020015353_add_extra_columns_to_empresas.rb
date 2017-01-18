class AddExtraColumnsToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas,:Direccion, :string
    add_column :empresas,:Telefono, :string
    add_column :empresas,:Contacto, :string
    add_column :empresas,:Email, :string
    add_column :empresas,:Calle, :string
    add_column :empresas,:NoExterior, :string
    add_column :empresas,:NoInterior, :string
    add_column :empresas,:CP, :string

    remove_column :empresas,:Empresa, :string

  end
end
