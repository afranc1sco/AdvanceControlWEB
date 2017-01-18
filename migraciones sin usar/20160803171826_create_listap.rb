class CreateListap < ActiveRecord::Migration
  def change
    create_table :listap do |t|
      t.string :lista
      t.boolean :tipo
      t.timestamp :fechaini
      t.timestamp :fechafin
      t.string :idempresa

      t.timestamps null: false
    end
  end
end
