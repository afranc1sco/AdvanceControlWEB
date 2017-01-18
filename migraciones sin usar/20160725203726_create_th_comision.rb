class CreateThComision < ActiveRecord::Migration
  def change
    create_table :th_comision do |t|
      t.string :status
      t.text :comentarios
      t.string :idempresa
      t.string :id_producto

      t.timestamps null: false
    end
  end
end
