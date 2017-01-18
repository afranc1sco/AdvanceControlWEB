class Medidor < ActiveRecord::Base
  self.primary_key = 'IdRow'

  scope :ruta, ->(params) { where(IdRuta: params[:search])} # model
  scope :dia, ->(params) { where(DiaO: params[:diao])} # model



end
