class Ayudante < ActiveRecord::Base
  self.primary_key = "id_ayudante"
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
end
