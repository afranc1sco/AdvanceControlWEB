class AddTipoToVendedores < ActiveRecord::Migration
  def change
    add_column :vendedores, :Tipo, :string
  end
end
