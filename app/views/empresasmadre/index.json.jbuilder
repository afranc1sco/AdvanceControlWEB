json.array!(@empresasmadre) do |empresamadre|
  json.extract! empresamadre, :id, :EmpresaMadre, :Telefono, :Contacto, :Email, :RCF, :Direccion
  json.url empresamadre_url(empresamadre, format: :json)
end
