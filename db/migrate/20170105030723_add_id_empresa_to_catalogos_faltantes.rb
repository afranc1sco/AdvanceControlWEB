class AddIdEmpresaToCatalogosFaltantes < ActiveRecord::Migration
  def change
    add_column :mvomerma,:IdEmpresa, :string
    add_column :formaspag,:IdEmpresa, :string
    add_column :mvodev,:IdEmpresa, :string

  end
end
