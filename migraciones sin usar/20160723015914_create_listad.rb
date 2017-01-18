class CreateListad < ActiveRecord::Migration
  def change
    create_table :listad do |t|
      t.string :lista
      t.string :tipo
      t.boolean :caduca
      t.date :fechaini
      t.date :fechafin
      t.string :idempresa

      t.timestamps null: false
    end
  end
end
