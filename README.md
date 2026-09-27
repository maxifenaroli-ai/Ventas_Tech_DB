Justificación Técnica - Pipeline ETL
Tratamiento de valores nulos: se decide reemplazar los "null" dentro de las columnas con formato texto por "info pendiente" ya que eliminar estas filas implicaría perder transacciones de venta asociadas a estos clientes en la tabla Fact_Ventas
Tramiento de valores nulos en columnas de número: se decide reemplazarlos por ceros para preservar el tipo de dato numérico (decimal/entero) y evitar transformar la columna a formato texto.
