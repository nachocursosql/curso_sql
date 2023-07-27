-- Crear tres vistas de ejemplo
-- Vista de empleados con sus salarios
CREATE view retailschema.vistaempleadossalarios
AS
  SELECT empleadoid,
         nombre,
         apellido,
         salario
  FROM   retailschema.empleados;

-- Vista de ventas con información de los productos
CREATE view retailschema.vistaventasproductos
AS
  SELECT ventaid,
         producto,
         cantidad,
         preciounitario
  FROM   retailschema.ventas;

-- Vista de facturas y total de ventas con IVA
CREATE view retailschema.vistafacturasventasiva
AS
  SELECT f.facturaid,
         f.fechafactura,
         v.ventaid,
         v.producto,
         v.cantidad,
         v.preciounitario,
         f.totalconiva
  FROM   retailschema.facturacion f
         INNER JOIN retailschema.ventas v
                 ON f.ventaid = v.ventaid; 