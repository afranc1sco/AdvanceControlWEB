class CreateDetallelpromaster < ActiveRecord::Migration
  def change
    create_table :detallelpromaster do |t|
      t.string :IdLm
      t.string :IdPromo
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
