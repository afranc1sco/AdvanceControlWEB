class CreateCobranza < ActiveRecord::Migration
  def change
    create_table :cobranza do |t|
      t.string :Cliente
      t.string :Documento
      t.string :Saldo
      t.string :Status
      t.string :RutaId
      t.string :UltPago
      t.string :FechaPag
      t.string :FechaVence
      t.string :FolioInterno
      t.string :TipoDoc
      t.string :DiaO
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
