class AddCoverToProducts < ActiveRecord::Migration
  def change
    add_attachment :productos,:cover
  end
end
