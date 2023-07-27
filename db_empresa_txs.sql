BEGIN TRANSACTION;

INSERT INTO RetailSchema.Empleados (EmpleadoID, Nombre, Apellido, Puesto, Salario, FechaContratacion)
VALUES (1, 'Juan', 'Pérez', 'Vendedor', 2500.00, '2023-01-15');

COMMIT;

-------------------------------
BEGIN TRANSACTION;

DECLARE @TransaccionID INT;

INSERT INTO RetailSchema.Transacciones (PuntoVentaID, FechaTransaccion, Tipo, Total)
VALUES (1, GETDATE(), 'Compra', 500.00);

SET @TransaccionID = SCOPE_IDENTITY();

INSERT INTO RetailSchema.Compras (TransaccionID, FechaCompra, Producto, Cantidad, PrecioUnitario)
VALUES (@TransaccionID, '2023-07-27', 'Producto A', 5, 100.00);

COMMIT;

-------------------------------
BEGIN TRANSACTION;

DECLARE @TransaccionID INT;

INSERT INTO RetailSchema.Transacciones (PuntoVentaID, FechaTransaccion, Tipo, Total)
VALUES (2, GETDATE(), 'Venta', 350.00);

SET @TransaccionID = SCOPE_IDENTITY();

INSERT INTO RetailSchema.Ventas (TransaccionID, FechaVenta, Producto, Cantidad, PrecioUnitario)
VALUES (@TransaccionID, '2023-07-27', 'Producto B', 3, 100.00);

INSERT INTO RetailSchema.Facturacion (VentaID, FechaFactura, TotalVenta, IVA, TotalConIVA)
VALUES (@TransaccionID, '2023-07-27', 300.00, 50
