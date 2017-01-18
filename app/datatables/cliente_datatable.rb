class ClienteDatatable < AjaxDatatablesRails::Base
  # uncomment the appropriate paginator module,
  # depending on gems available in your project.
  include AjaxDatatablesRails::Extensions::Kaminari
  # include AjaxDatatablesRails::Extensions::WillPaginate
  # include AjaxDatatablesRails::Extensions::SimplePaginator
  def_delegator :link_to



  def sortable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.name'
    @sortable_columns ||= ['clientes.IdCli']
  end

  def searchable_columns
    # list columns inside the Array in string dot notation.
    # Example: 'users.name'
    @searchable_columns ||= ['clientes.IdCli']
  end

  private

  def data
    records.map do |record|
      [
        record.IdCli,
        record.Nombre

      ]
    end
  end


  def from
    @from ||= options[:from]
  end

  def get_raw_records
    Cliente.all
  end

end
