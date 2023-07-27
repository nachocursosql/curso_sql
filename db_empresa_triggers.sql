-- Crear dos triggers de ejemplo
-- Trigger que actualiza el salario de un empleado después de una compra
CREATE TRIGGER ActualizarSalarioDespuesCompra
ON RetailSchema.Compras
AFTER INSERT
AS
BEGIN
    DECLARE @EmpleadoID INT;
    DECLARE @TotalCompra DECIMAL(10, 2);

    SELECT @EmpleadoID = e.EmpleadoID, @TotalCompra = i.Cantidad * i.PrecioUnitario
    FROM inserted i
    INNER JOIN RetailSchema.Ventas v ON i.TransaccionID = v.TransaccionID
    INNER JOIN RetailSchema.Empleados e ON v.Producto = e.Puesto;

    UPDATE RetailSchema.Empleados
    SET Salario = Salario + @TotalCompra
    WHERE EmpleadoID = @EmpleadoID;
END;

-- Trigger que actualiza el stock después de una venta
CREATE TRIGGER ActualizarStockDespuesVenta
ON RetailSchema.Ventas
AFTER INSERT
AS
BEGIN
    DECLARE @Producto VARCHAR(100);
    DECLARE @Cantidad INT;

    SELECT @Producto = Producto, @Cantidad = Cantidad
    FROM inserted;

    UPDATE RetailSchema.Inventario
    SET Stock = Stock - @Cantidad
    WHERE Producto = @Producto;
END;


