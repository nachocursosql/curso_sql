-- Crear un stored procedure de ejemplo
CREATE PROCEDURE RetailSchema.ObtenerVentasPorPuntoVenta
    @PuntoVentaID INT
AS
BEGIN
    SELECT v.VentaID, v.FechaVenta, v.Producto, v.Cantidad, v.PrecioUnitario
    FROM RetailSchema.Ventas v
    INNER JOIN RetailSchema.Transacciones t ON v.TransaccionID = t.TransaccionID
    WHERE t.PuntoVentaID = @PuntoVentaID;
END;