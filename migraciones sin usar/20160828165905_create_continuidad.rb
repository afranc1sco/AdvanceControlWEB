class CreateContinuidad < ActiveRecord::Migration
  def change
    create_table :continuidad do |t|
      t.string :RutaID
      t.string :DiaO
      t.string :FolVta
      t.string :FolPed
      t.string :FolDevol
      t.string :FolCob
      t.string :UDiaO
      t.string :CteNvo
      t.string :IdEmpresa

      t.timestamps null: false
    end
  end
end
