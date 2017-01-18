class CreateTdComision < ActiveRecord::Migration
  def change
    create_table :td_comision do |t|
      t.string :ID_Comision
      t.integer :RangoIni
      t.integer :RangoFin
      t.integer :Angente
      t.integer :Ayudante
      t.integer :Tipo
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
