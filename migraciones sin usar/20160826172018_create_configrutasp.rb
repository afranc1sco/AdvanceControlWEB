class CreateConfigrutasp < ActiveRecord::Migration
  def change
    create_table :configrutasp do |t|
      t.string :RutaId
      t.string :ModelPrinter
      t.string :VelCom
      t.string :COM
      t.string :Server
      t.string :Puerto
      t.string :ServerGPS
      t.string :GPS
      t.string :PuertoG
      t.string :PagoContado
      t.string :CteNvo
      t.string :CveCteNvo
      t.string :IdEmpresa
      t.string :SugerirCant
      t.string :PromoEq

      t.timestamps null: false
    end
  end
end
