class AddSucursalToEmpresas < ActiveRecord::Migration
  def change
    add_column :empresas, :Sucursal, :string
  end
end
