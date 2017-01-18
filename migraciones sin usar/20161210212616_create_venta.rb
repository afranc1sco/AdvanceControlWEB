class CreateVenta < ActiveRecord::Migration
  def change
    create_table :venta do |t|
      t.string :Id
      t.string :RutaId
      t.string :VendedorId
      t.string :CodCliente
      t.string :Documento
      t.string :Fecha
      t.string :TipoVta
      t.string :DiasCred
      t.string :CreditoDispo
      t.string :Saldo
      t.string :Fvence
      t.string :SubTotal
      t.string :IVA
      t.string :IEPS
      t.string :TOTAL
      t.string :EnLetra
      t.string :Items
      t.string :FormaPag
      t.string :DocSalida
      t.string :DiaO
      t.string :Cancelada
      t.string :Kg
      t.string :ID_Ayudante1
      t.string :ID_Ayudante2
      t.string :VenAyunate
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
