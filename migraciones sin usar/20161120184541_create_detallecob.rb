class CreateDetallecob < ActiveRecord::Migration
  def change
    create_table :detallecob do |t|
      t.string :IdCobranza
      t.string :Abono
      t.string :Fecha
      t.string :RutaId
      t.string :SaldoAnt
      t.string :Saldo
      t.string :FormaP
      t.string :DiaO
      t.string :Documento
      t.string :Cliente
      t.string :IdEmpresa
      t.string :Cancelada

      t.timestamps null: false
    end
  end
end
