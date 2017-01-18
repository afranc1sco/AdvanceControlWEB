class AddEmpresaMadreIdToEmpresas < ActiveRecord::Migration
  def change
    add_reference :empresas, :empresamadre, index: true, foreign_key: true
  end
end
