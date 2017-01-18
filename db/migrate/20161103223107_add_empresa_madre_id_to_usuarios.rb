class AddEmpresaMadreIdToUsuarios < ActiveRecord::Migration
  def change
    add_reference :usuarios, :empresamadre, index: true, foreign_key: true
  end
end
