class Productoneg < ActiveRecord::Base
  belongs_to :producto, class_name:"Producto", foreign_key: "CodProd"

  def self.busqueda_general(params)
  query = select('[Productonegado].CodProd,[Productonegado].Pidieron, [Productonegado].Habia, [Productonegado].DiaO, [Productonegado].RutaId')
        .group(:RutaId, :Pidieron, :Habia, :DiaO, :CodProd)
       .where("(Productonegado.RutaId = :rutaId or :rutaId = '') AND (Productonegado.DiaO = :diao or :diao = '') AND (Productonegado.IdEmpresa = :idempresa)",{rutaId: params[:search],diao: params[:diao], idempresa: params[:search6]})
       .distinct
   end



 end
