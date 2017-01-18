class Relclili < ActiveRecord::Base
  self.primary_key = "Id"
  #para buscar registros donde listad sea igual al parametro id que se para por el url, para su funcionamiento, se debe de colocar tambien en el controlador @relclilis = Relclili.clienteslistad(params[:id])
  scope :clienteslistad, -> (id_param) { where(listad: id_param) }
  scope :clienteslistap, -> (id_param) { where(listap: id_param) }
  scope :clientespromociones, -> (id_param) { where(ListaPromo: id_param) }
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }

  belongs_to :listapromomast, class_name:"Listapromomast", foreign_key: "ListaPromo"

  belongs_to :cliente, class_name:"Cliente", foreign_key: "CodCliente"


end
