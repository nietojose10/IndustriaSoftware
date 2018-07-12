CREATE DATABASE RESTAURANTE;
USE RESTAURANTE;

#drop database restaurante;

CREATE TABLE Persona (
  idPersona INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  PrimerNombre VARCHAR(45) NOT NULL,
  SegundoNombre VARCHAR(45) NULL,
  PrimerApellido VARCHAR(45) NOT NULL,
  SegundoApellido VARCHAR(45) NULL,
  Identidad VARCHAR(25) NOT NULL,
  Email VARCHAR(45) NOT NULL,
  Colonia VARCHAR(45) NOT NULL,
  Calle VARCHAR(45) NOT NULL,
  NumeroCasa VARCHAR(10) NULL
);


CREATE TABLE TelefonoPersona (
  idTelefono INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Numero VARCHAR(8) NOT NULL,
  idPersona_fk INT NOT NULL,
  CONSTRAINT Persona_TelefonoFK FOREIGN KEY (idPersona_fk)
    REFERENCES Persona (idPersona)
  );


CREATE TABLE Sucursal (
  idSucursal INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Colonia VARCHAR(45) NOT NULL,
  Calle VARCHAR(45) NOT NULL
  Longitud FLOAT NOT NULL,
  Latitud FLOAT NOT NULL
  );


CREATE TABLE TelefonoSucursal (
  idTelefonoSucursal INT NOT NULL PRIMARY KEY,
  Numero VARCHAR(8) NOT NULL,
  idSucursal_fk INT NOT NULL ,
  CONSTRAINT Sucursal_TelefonoFK FOREIGN KEY (idSucursal_fk)
    REFERENCES Sucursal (idSucursal)
  );
  

CREATE TABLE TipoEmpleado (
  idTipoEmpleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombreTipoEmpleado VARCHAR(45) NOT NULL,
  Salario FLOAT NOT NULL
  );

CREATE TABLE Empleado (
  idEmpleado INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FechaIngreso DATE NOT NULL,
  idPersona_fk INT NOT NULL,
  idTipoEmpleado_fk INT NOT NULL,
  idSucursal_fk INT NOT NULL,
  CONSTRAINT Empleado_TipoEmpleadoFK FOREIGN KEY (idTipoEmpleado_fk)
    REFERENCES TipoEmpleado (idTipoEmpleado),
  CONSTRAINT Empleado_PersonaFK FOREIGN KEY (idPersona_fk)
    REFERENCES Persona (idPersona),
  CONSTRAINT Empleado_SucursalFK FOREIGN KEY (idSucursal_fk)
    REFERENCES Sucursal (idSucursal)
  );


CREATE TABLE Cliente (
  idCliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Contrasenia BLOB NOT NULL,
  idPersona_fk INT NOT NULL,
  CONSTRAINT Cliente_PersonaFK FOREIGN KEY (idPersona_fk)
    REFERENCES Persona (idPersona)
  );


CREATE TABLE Mesas (
  idMesas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NumeroMesa INT NOT NULL,
  idSucursal_fk INT NOT NULL,
  CONSTRAINT Mesas_SucursalFK FOREIGN KEY (idSucursal_fk)
    REFERENCES Sucursal (idSucursal)
  );
  

CREATE TABLE TipoOrden (
  idTipoOrden INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombreTipoOrden VARCHAR(45) NOT NULL,
  Descripcion VARCHAR(200) NOT NULL
  );


CREATE TABLE Orden (
  idOrden INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Estado BOOLEAN NOT NULL,
  idTipoOrden_fk INT NOT NULL,
  idEmpleado_fk INT NOT NULL,
  idMesas_fk INT NOT NULL,
  CONSTRAINT Orden_TipoOrdenFK FOREIGN KEY (idTipoOrden_fk)
    REFERENCES TipoOrden (idTipoOrden),
  CONSTRAINT Orden_EmpleadoFK FOREIGN KEY (idEmpleado_fk)
    REFERENCES Empleado (idEmpleado),
  CONSTRAINT Orden_MesasFK FOREIGN KEY (idMesas_fk)
    REFERENCES Mesas (idMesas)
  );

    
CREATE TABLE TipoPago (
  idTipoPago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nombreTipoPago VARCHAR(45) NOT NULL
  );


CREATE TABLE Pago (
  idPago INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Estado BOOLEAN NOT NULL,
  idTipoPago_fk INT NOT NULL,
  CONSTRAINT Pago_TipoPagoFK FOREIGN KEY (idTipoPago_fk)
    REFERENCES TipoPago (idTipoPago)
  );

  
CREATE TABLE Factura (
  idFactura INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  FechaFactura DATE NOT NULL,
  Subtotal FLOAT NOT NULL,
  ISV FLOAT NOT NULL,
  TotalPagar FLOAT NOT NULL,
  idPago_fk INT NOT NULL,
  idOrden_fk INT NOT NULL,
  idCliente_fk INT NOT NULL,
  CONSTRAINT Factura_PagoFK FOREIGN KEY (idPago_fk)
    REFERENCES Pago (idPago),
  CONSTRAINT Factura_OrdenFK FOREIGN KEY (idOrden_fk)
    REFERENCES Orden (idOrden),
  CONSTRAINT Factura_ClienteFK FOREIGN KEY (idCliente_fk)
    REFERENCES Cliente (idCliente)
  );


CREATE TABLE TipoPlatillo (
  idTipoPlatillo INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombreTipoPlatillo VARCHAR(50) NOT NULL
  );
  

CREATE TABLE Platillos (
  idPlatillos INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombrePlatillo VARCHAR(45) NOT NULL,
  Precio FLOAT NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  idTipoPlatillo_fk INT NOT NULL,
  CONSTRAINT Platillos_TipoPlatilloFK FOREIGN KEY (idTipoPlatillo_fk)
    REFERENCES TipoPlatillo (idTipoPlatillo)
  );


CREATE TABLE TipoBebida (
  idTipoBebida INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombreTipoBebida VARCHAR(50) NOT NULL
  );


CREATE TABLE Bebidas (
  idBebidas INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombreBebida VARCHAR(50) NOT NULL,
  Precio FLOAT NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  idTipoBebida_fk INT NOT NULL,
  CONSTRAINT Bebidas_TipoBebidaFK FOREIGN KEY (idTipoBebida_fk)
    REFERENCES TipoBebida (idTipoBebida)
);


CREATE TABLE OrdenPlatillo (
  idOrden_fk INT NOT NULL,
  idPlatillo_fk INT NOT NULL,
  PRIMARY KEY (idOrden_fk, idPlatillo_fk),
  CONSTRAINT Orden_PlatilloFK FOREIGN KEY (idOrden_fk)
    REFERENCES Orden (idOrden),
  CONSTRAINT Platillo_OrdenFK FOREIGN KEY (idPlatillo_fk)
    REFERENCES Platillos (idPlatillos)
  );


CREATE TABLE OrdenBebidas (
  idOrden_fk INT NOT NULL,
  idBebidas_fk INT NOT NULL,
  PRIMARY KEY(idOrden_fk, idBebidas_fk),
  CONSTRAINT Orden_BebidasFK FOREIGN KEY (idOrden_fk)
    REFERENCES Orden (idOrden),
  CONSTRAINT Bebidas_Ordenfk FOREIGN KEY (idBebidas_fk)
    REFERENCES Bebidas (idBebidas)
  );


CREATE TABLE Proveedor (
  idProveedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  Nombre VARCHAR(45) NOT NULL,
  Apellido VARCHAR(45) NOT NULL,
  Telefono VARCHAR(25) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  NombreEmpresa VARCHAR(50) NOT NULL,
  TelefonoEmpresa VARCHAR(45) NOT NULL
  );


CREATE TABLE TipoIngrediente (
  idTipoIngrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombreTipoIngrediente VARCHAR(50) NOT NULL
  );
  
  
CREATE TABLE Ingrediente (
  idIngrediente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  NombreIngrediente VARCHAR(50) NOT NULL,
  Descripcion VARCHAR(100) NOT NULL,
  idTipoIngrediente_fk INT NOT NULL,
  idProveedor_fk INT NOT NULL,
   CONSTRAINT Ingrediente_TipoIngredienteFK FOREIGN KEY (idTipoIngrediente_fk)
    REFERENCES TipoIngrediente (idTipoIngrediente),
  CONSTRAINT Ingrediente_ProveedorFK FOREIGN KEY (idProveedor_fk)
    REFERENCES Proveedor (idProveedor)
  );


CREATE TABLE Bodega (
  idBodega INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  idSucursal_fk INT NOT NULL,
  CONSTRAINT Bodega_SucursalFK FOREIGN KEY (idSucursal_fk)
    REFERENCES Sucursal (idSucursal)
  );


CREATE TABLE BodegaIngrediente (
  idBodega_fk INT NOT NULL,
  idIngrediente_fk INT NOT NULL,
  PRIMARY KEY(idBodega_fk, idIngrediente_fk),
  CONSTRAINT Bodega_IngredienteFK FOREIGN KEY (idBodega_fk)
    REFERENCES Bodega (idBodega),
  CONSTRAINT Ingrediente_BodegaFK FOREIGN KEY (idIngrediente_fk)
    REFERENCES Ingrediente (idIngrediente)
    );