class ProductosController < ApplicationController
  before_action :set_producto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_usuario!

  # GET /productos
  # GET /productos.json
  def index
    @productos = Producto.activos.por_empresa(current_usuario.empresa_id)
    @producto = Producto.new
    #@producto.build_productosxpza #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    #pero en el caso de ser un has_many se debe usar @producto.productosxpza.build
    @producto.build_productosxpza
    @productoenvase = Productoenvas.por_empresa(current_usuario.empresa_id)
    @productoenvas = Productoenvas.new
    @catgrupo = Catgrupo.new

    @catgrupos = Catgrupo.activos.producto_sector.por_empresa(current_usuario.empresa_id)
    @catunidadmed = Catunidadmed.new
    @unidadmedidas = Catunidadmed.activos.por_empresa(current_usuario.empresa_id)
    @catmarca = Catmarca.new
    @catmarcas = Catmarca.producto_marca.activos.por_empresa(current_usuario.empresa_id)
    respond_to do |format|
      format.html
      format.csv { send_data @productos.to_csv}
      format.xls
    end

  end



  def import
    Producto.import(params[:file])
    redirect_to productos_path, notice: "Productos importados."
  end

  def productos_check
    @productox = Producto.comprobar_existencia(params[:producto][:Clave]).first
    respond_to do |format|
    format.json { render :json => !@productox }
    end
  end

  # GET /productos/1
  # GET /productos/1.json
  def show

  end

  # GET /productos/new
  def new
    @producto = Producto.new
    @producto.build_productosxpza
  end

  # GET /productos/1/edit
  def edit

  end

  # POST /productos
  # POST /productos.json
  def create
    @catgrupos = Catgrupo.activos.producto_sector.por_empresa(current_usuario.empresa_id)
    @unidadmedidas = Catunidadmed.activos.por_empresa(current_usuario.empresa_id)
    @catmarcas = Catmarca.producto_marca.activos.por_empresa(current_usuario.empresa_id)

    @producto = Producto.new(producto_params)

    respond_to do |format|
      if @producto.save
        format.html { redirect_to @producto, notice: 'Producto was successfully created.' }
        format.json { render :show, status: :created, location: @producto }

        if params[:envase]
          format.js {render :js => "window.location.href='"+producto_envase_path(@producto)+"'"}
        else
          format.js {flash.now[:notice] = 'El producto se ha creado de forma exitosa.'} #ajax
        end

      else
        format.html { render :new }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al crear el producto.'} #ajax

      end
    end
  end

  # PATCH/PUT /productos/1
  # PATCH/PUT /productos/1.json
  def update
    respond_to do |format|
      if @producto.update(producto_params)
        format.html { redirect_to @producto, notice: 'Producto was successfully updated.' }
        format.json { render :show, status: :ok, location: @producto }

        if params[:envase]
          format.js {render :js => "window.location.href='"+producto_envase_path(@producto)+"'"}
        else
          format.js {flash.now[:notice] = 'El producto se ha actualizado de forma exitosa.'} #ajax
        end

      else
        format.html { render :edit }
        format.json { render json: @producto.errors, status: :unprocessable_entity }
        format.js {flash.now[:alert] = 'Error al actualizar el producto.'} #ajax

      end
    end
  end

  # DELETE /productos/1
  # DELETE /productos/1.json
  def destroy
    respond_to do |format|
      format.html { redirect_to productos_url, notice: 'Producto was successfully destroyed.' }
      format.json { head :no_content }

      if @producto.Status == "A"
        @producto.update(Status:"I")
        format.js {flash.now[:notice] = 'El producto se ha borrado de forma exitosa.'} #ajax

      else
        @producto.update(Status:"A")
        format.js {flash.now[:notice] = 'El producto se ha habilitado de forma exitosa.'} #ajax
      end

    end
  end

  def inactivos
    @productos = Producto.inactivos.por_empresa(current_usuario.empresa_id)
    @producto = Producto.new
    #@producto.build_productosxpza #debido a que es una relacion has_one se debe hacer de esta forma: @producto.build_productosxpza
    #pero en el caso de ser un has_many se debe usar @producto.productosxpza.build
    @producto.build_productosxpza

    respond_to do |format|
      format.html
      format.csv { send_data @productos.to_csv}
      format.xls
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_producto
      @producto = Producto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def producto_params
      params.require(:producto).permit(:Clave, :ClaveMarca, :UniMedEq, :Producto, :CodBarras, :Granel, :IVA, :IEPS, :UniMed, :VBase, :Equivalente, :Sector, :Ban_Envase, :IdClasp, :IdEmpresa, :Status, :Producto_id, :cover, productosxpza_attributes: [:id, :PzaXCja, :IdEmpresa ])
    end
end
