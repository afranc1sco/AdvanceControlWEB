class CreateDetalleld < ActiveRecord::Migration
  def change
    create_table :detalleld do |t|

      t.timestamps null: false
    end
  end
end
