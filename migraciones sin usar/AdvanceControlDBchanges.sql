use Izt_AdvanceControl_2016
go

ALTER TABLE Usuarios ADD empresa_id VARCHAR(50),
ALTER TABLE Usuarios ADD CONSTRAINT FK_Usuario_empresa FOREIGN KEY (empresa_id) REFERENCES Empresas(IdEmpresa),
ALTER TABLE Vendedores ALTER COLUMN idvehiculo VARCHAR(255) NULL,
ALTER TABLE TH_Comision ADD CONSTRAINT FK_TH_Comision_Producto FOREIGN KEY (ID_Producto) REFERENCES Productos(Clave),
ALTER TABLE rutas 
