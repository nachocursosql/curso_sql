-- Crear la base de datos para la empresa de retail
CREATE DATABASE EmpresaRetail;
USE EmpresaRetail;

-- Crear el esquema
CREATE SCHEMA RetailSchema;

-- Tabla de empleados
CREATE TABLE RetailSchema.Empleados (
    EmpleadoID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Puesto VARCHAR(50),
    Salario DECIMAL(10, 2),
    FechaContratacion DATE
);

-- Tabla de puntos de venta
CREATE TABLE RetailSchema.PuntosDeVenta (
    PuntoVentaID INT PRIMARY KEY,
    Nombre VARCHAR(100),
    Direccion VARCHAR(200),
    Ciudad VARCHAR(50),
    Estado VARCHAR(50)
);

-- Tabla de transacciones
CREATE TABLE RetailSchema.Transacciones (
    TransaccionID INT PRIMARY KEY,
    PuntoVentaID INT,
    FechaTransaccion DATETIME,
    Tipo VARCHAR(50),
    Total DECIMAL(10, 2),
    FOREIGN KEY (PuntoVentaID) REFERENCES RetailSchema.PuntosDeVenta(PuntoVentaID)
);

-- Tabla de compras
CREATE TABLE RetailSchema.Compras (
    CompraID INT PRIMARY KEY,
    TransaccionID INT,
    FechaCompra DATE,
    Producto VARCHAR(100),
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (TransaccionID) REFERENCES RetailSchema.Transacciones(TransaccionID)
);

-- Tabla de ventas
CREATE TABLE RetailSchema.Ventas (
    VentaID INT PRIMARY KEY,
    TransaccionID INT,
    FechaVenta DATE,
    Producto VARCHAR(100),
    Cantidad INT,
    PrecioUnitario DECIMAL(10, 2),
    FOREIGN KEY (TransaccionID) REFERENCES RetailSchema.Transacciones(TransaccionID)
);

-- Tabla de facturación
CREATE TABLE RetailSchema.Facturacion (
    FacturaID INT PRIMARY KEY,
    VentaID INT,
    FechaFactura DATE,
    TotalVenta DECIMAL(10, 2),
    IVA DECIMAL(10, 2),
    TotalConIVA DECIMAL(10, 2),
    FOREIGN KEY (VentaID) REFERENCES RetailSchema.Ventas(VentaID)
);