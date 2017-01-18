class Usuario < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  scope :activos, -> { where(Status: true) }
  scope :inactivos, -> { where(Status: false) }
  scope :por_empresa, ->(user_id) { where(empresa_id: user_id) } # model

  scope :comprobar_existencia, ->(paramc) { where(usuario: paramc)} # model
  scope :comprobar_existencia_Email, ->(param_e) { where(email: param_e)} # model

  scope :datos, ->(user_id) { find_by(IdUsuario: user_id)} # para que no devuelva una coleccion, sino un solo registro

  self.primary_key = 'IdUsuario'
  belongs_to :empresa


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def login=(login)
    @login = login
  end

  def login
    @login || self.usuario || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
   conditions = warden_conditions.dup
   if login = conditions.delete(:login)
     where(conditions.to_hash).where(["lower(usuario) = :value OR lower(email) = :value", { :value => login.downcase }]).first
   elsif conditions.has_key?(:usuario) || conditions.has_key?(:email)
     where(conditions.to_hash).first
   end
 end

 def self.to_csv(options = {})#exportar
   CSV.generate(options) do |csv|
     csv << column_names
     all.each do |usuario|
       csv << usuario.attributes.values_at(*column_names)
     end
   end
 end




end
