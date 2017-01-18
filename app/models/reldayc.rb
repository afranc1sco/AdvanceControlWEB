class Reldayc < ActiveRecord::Base

  self.primary_key = "Id"
  belongs_to :cliente, class_name:"Cliente", foreign_key: "CodCli"

  belongs_to :relcliruta, class_name:"Relcliruta", foreign_key: "Id"

  scope :ruta, -> (id_param) { where(RutaId: id_param) }

  scope :ordered_by_title, -> { reorder(Lunes: :asc) }


  scope :dia_con_clientes, -> (id_param22) {
    if (id_param22) == "Lunes"
      where("Lunes > ?", '0')

    elsif (id_param22) == "Martes"
      where("Martes > ?", '0')

    elsif (id_param22) == "Miercoles"
      where("Miercoles > ?", '0')

    elsif (id_param22) == "Jueves"
      where("Jueves > ?", '0')

    elsif (id_param22) == "Viernes"
      where("Viernes > ?", '0')

    elsif (id_param22) == "Sabado"
      where("Sabado > ?", '0')

    elsif (id_param22) == "Domingo"
      where("Domingo > ?", '0')

    end }


    scope :dia_sin_clientes, -> (id_param23) {
      if (id_param23) == "Lunes"
        where("Lunes = ? OR Lunes IS NULL", '0')

      elsif (id_param23) == "Martes"
        where("Martes = ? OR Martes IS NULL", '0')

      elsif (id_param23) == "Miercoles"
        where("Miercoles = ? OR Miercoles IS NULL", '0')

      elsif (id_param23) == "Jueves"
        where("Jueves = ? OR Jueves IS NULL", '0')

      elsif (id_param23) == "Viernes"
        where("Viernes = ? OR Viernes IS NULL", '0')

      elsif (id_param23) == "Sabado"
        where("Sabado = ? OR Sabado IS NULL", '0')

      elsif (id_param23) == "Domingo"
        where("Domingo = ? OR Domingo IS NULL", '0')

      end }



end
