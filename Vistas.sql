

alter view vistaaviosalmacen
as
select AviosAlmacen.IDAvio as 'ID',
		AviosAlmacen.IDAvioAlmacen as 'Clave',
		AviosAlmacen.Nombre,
		AviosAlmacen.Tipo,
		AviosAlmacen_Detalle.IDProduccion as 'Folio Produccion',
		AviosAlmacen_Detalle.Cantidad
from AviosAlmacen,
		AviosAlmacen_Detalle
where AviosAlmacen.IDAvioAlmacen=AviosAlmacen_Detalle.IDAvioAlmacen_Detalle 
GO


create view avios_mas_bodega
as
select id_avios,
		nombre,
		precio,
		cantidad,
		tipo,
		idaviosbodega
from avios,
		avios_bodega
where avios.id_avios=avios_bodega.idavios
GO

create view vistabodegaavios2
as
Select avios.nombre,
		avios.tipo,
		avios_bodega.cantidad,
		case
		when avios.tipo = 0 then 'Boton'
		when avios.tipo = 1 then 'Bordado'
		when avios.tipo = 2 then 'Cierre'
		when avios.tipo = 3 then 'Cintas'
		when avios.tipo = 4 then 'Elastico'
		when avios.tipo = 5 then 'Encaje'
		when avios.tipo = 6 then 'Entretela'
		when avios.tipo = 7 then 'Etiqueta'
		when avios.tipo = 8 then 'Forro'
		when avios.tipo = 9 then 'Gancho'
		when avios.tipo = 10 then 'Hombreras'
		when avios.tipo = 11 then 'Hilo'
		when avios.tipo = 12 then 'Pellon'
		when avios.tipo = 13 then 'Otros'
		END as [Descripcion]
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios and cantidad!=0
GO


create view vistabodegaavios3
as
Select avios.nombre,
		avios.tipo,
		avios_bodega.cantidad,
		case
		when avios.tipo = 0 then 'Boton'
		when avios.tipo = 1 then 'Bordado'
		when avios.tipo = 2 then 'Cierre'
		when avios.tipo = 3 then 'Cintas'
		when avios.tipo = 4 then 'Elastico'
		when avios.tipo = 5 then 'Encaje'
		when avios.tipo = 6 then 'Entretela'
		when avios.tipo = 7 then 'Etiqueta'
		when avios.tipo = 8 then 'Forro'
		when avios.tipo = 9 then 'Gancho'
		when avios.tipo = 10 then 'Hombreras'
		when avios.tipo = 11 then 'Hilo'
		when avios.tipo = 12 then 'Pellon'
		when avios.tipo = 13 then 'Otros'
		END as [Descripcion]
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios and cantidad=0 and avios.precio=0
GO


create view vistabodegaavios4
as
Select avios.nombre,
		avios.tipo,
		avios_bodega.cantidad,
		case
		when avios.tipo = 0 then 'Boton'
		when avios.tipo = 1 then 'Bordado'
		when avios.tipo = 2 then 'Cierre'
		when avios.tipo = 3 then 'Cintas'
		when avios.tipo = 4 then 'Elastico'
		when avios.tipo = 5 then 'Encaje'
		when avios.tipo = 6 then 'Entretela'
		when avios.tipo = 7 then 'Etiqueta'
		when avios.tipo = 8 then 'Forro'
		when avios.tipo = 9 then 'Gancho'
		when avios.tipo = 10 then 'Hombreras'
		when avios.tipo = 11 then 'Hilo'
		when avios.tipo = 12 then 'Pellon'
		when avios.tipo = 13 then 'Otros'
		END as [Descripcion]
from avios,
		avios_bodega
where avios_bodega.idavios=avios.id_avios and avios.precio=0
GO



create view vista_prendas_separado
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		orden_produccion.fecha_corte_terminado as 'Termina Corte',
		orden_produccion.fecha_separado_inicio as 'Inicio Separado',
		orden_produccion.fecha_separado_terminado as 'Termina Separado',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.rutas as 'Rutas',
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.separado is not null and orden_produccion.id_orden=produccion.idorden and orden_produccion.separado is null and orden_produccion.corte is not null
GO


create view vista_prendas_trazado
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		orden_produccion.fecha_ruta as 'Rutas Establecidas',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.rutas as 'Rutas',
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.trazado_completo IS NULL and orden_produccion.id_orden=produccion.idorden
GO
			
					
create view vista_prendas_corte
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		orden_produccion.fecha_trazado_inicio as 'Empezo el trazado',
		orden_produccion.fecha_trazado_terminado as 'Termino el trazado e inicio tendido',
		orden_produccion.fecha_tendido as 'Corte Inicia',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		produccion.rutas as 'Rutas',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.corte is null and orden_produccion.id_orden=produccion.idorden
GO

create view vista_prendas_maquila
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Ruta ficha',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.rutas as 'Rutas',
		ficha_tecnica.tiempo_costura as 'Tiempo Costura',
		ficha_tecnica.especificacionescostura as 'Especificaciones de costura',
		produccion.idficha,
		dbo.Pellones.Modelo,
		dbo.Pellones.Pellon as [Pedido]
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion,
		ficha_tecnica,
		Pellones
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and produccion.idficha=ficha_tecnica.idficha_detalle and orden_produccion.separado is not null and orden_produccion.id_orden=produccion.idorden and orden_produccion.id_orden=Pellones.Orden and orden_produccion.en_maquila is null
GO

create view vista_prendas_entrada
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		orden_produccion.fecha_maquila_entrada as 'Entrada Maquila Completa',
		orden_produccion.fecha_acabados_terminado as 'Acabados Terminado',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.rutas as 'Rutas',
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.en_maquila is not null and orden_produccion.id_orden=produccion.idorden and orden_produccion.calidad is null
GO

create view vista_prendas_entrega
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as 'Asunto',
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		orden_produccion.fecha_acabados_terminado as 'Acabados Terminado',
		orden_produccion.fecha_acabados_inicio as 'Termina Calidad',
		orden_produccion.observaciones as 'Notas',
		produccion.observaciones_diseño as 'Observaciones/Notas Produccion',
		produccion.rutas as 'Rutas',
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.calidad is not null and orden_produccion.id_orden=produccion.idorden and orden_produccion.fecha_entrega is null
GO
							


create view VistaTerminadosMonitor
as
select orden_produccion.asunto as 'Prenda',
		orden_produccion.fecha_inicio as 'Entra Pedido',
		orden_produccion.fecha_entrega as 'Entregado',
		orden_produccion.fecha_avios as 'Avios Completos',
		orden_produccion.fecha_tela as 'Tela Completa',
		orden_produccion.fecha_trazado_inicio as 'Se imprimio la hoja de corte',
		orden_produccion.fecha_ruta as 'Rutas Establecidas',
		orden_produccion.fecha_trazado_inicio as 'Empezo el trazado',
		orden_produccion.fecha_trazado_terminado as 'Termino el trazado',
		orden_produccion.fecha_tendido as 'Termina tendido',
		orden_produccion.fecha_corte_inicio as 'Inicia Corte',
		orden_produccion.fecha_corte_terminado as 'Termina Corte',
		orden_produccion.fecha_separado_inicio as 'Inicio Separado',
		orden_produccion.fecha_separado_terminado as 'Termina Separado',
		orden_produccion.fecha_maquila_salida as 'Sale a maquila',
		orden_produccion.fecha_maquila_entrada as 'Entrada Completa de Maquila',
		orden_produccion.fecha_acabados_terminado as 'Acabados terminado'
from orden_produccion
where orden_produccion.Terminado is not null
GO				
						
create view VistaActivosMonitor
as
select orden_produccion.asunto as 'Prenda',
		orden_produccion.fecha_inicio as 'Entra Pedido',
		orden_produccion.fecha_avios as 'Avios Completos',
		orden_produccion.fecha_tela as 'Tela Completa',
		orden_produccion.fecha_trazado_inicio as 'Se imprimio la hoja de corte',
		orden_produccion.fecha_ruta as 'Rutas Establecidas',
		orden_produccion.fecha_trazado_terminado as 'Termino el trazado',
		orden_produccion.fecha_tendido as 'Termina tendido',
		orden_produccion.fecha_corte_inicio as 'Inicia Corte',
		orden_produccion.fecha_corte_terminado as 'Termina Corte',
		orden_produccion.fecha_separado_inicio as 'Inicio Separado',
		orden_produccion.fecha_separado_terminado as 'Termina Separado',
		orden_produccion.fecha_maquila_salida as 'Sale a maquila',
		orden_produccion.fecha_maquila_entrada as 'Entrada Completa de Maquila',
		orden_produccion.fecha_acabados_terminado as 'Acabados terminado'
from orden_produccion
where orden_produccion.Terminado is null
GO		

create view Vfichas_tecnicas2
as
select  nombre_prenda,
		modelo,
		tela,
		ancho_tela,
		consumo_tela,
		combinacion,
		ancho_tela_conbinacion,
		consumo_conbinacion,
		forro,
		ancho_tela_forro,
		consumo_forro,
		tiempo_costura,
		tiempo_acabados,
		idficha_tecnica,
		costo_minuto,
		costo_metro,
		clientes.nombre,
		idclientes,
		ficha_tecnica.especificacionescostura,
		especificacionesficha.Especificaciones
from clientes,
	ficha_tecnica,
	ficha_detalle,
	especificacionesficha
where ficha_tecnica.cliente=clientes.idclientes and ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle and ficha_tecnica.idficha_tecnica=especificacionesficha.fichatecnica
GO

create view ver_avios_ficha
as
select id_ficha,
		nombre,
		cantidad,
		precio,
		costo,
		avios.id_avios
from avios,
		avios_detalle
where ( avios_detalle.id_avio=avios.id_avios)
GO

create view ordenesvista
as
select orden_produccion.id_orden,
	produccion.idficha,
	orden_produccion.asunto,
	ficha_detalle.tela,
	ficha_detalle.forro,
	ficha_detalle.consumo_forro,
	ficha_detalle.combinacion,
	ficha_detalle.consumo_conbinacion,
	orden_produccion.id_cliente
from orden_produccion,
	produccion,
	ficha_detalle
where produccion.idorden=orden_produccion.id_orden and orden_produccion.fecha_trazado_inicio is null and ficha_detalle.idficha_detalle=produccion.idficha
GO
			
create view Vistafichastecnicascompleta
as
select ficha_tecnica.idficha_tecnica,
		ficha_detalle.nombre_prenda,
		ficha_detalle.modelo,
		ficha_detalle.tela,
		ficha_detalle.ancho_tela,
		ficha_detalle.consumo_tela,
		ficha_detalle.combinacion,
		ficha_detalle.ancho_tela_conbinacion,
		ficha_detalle.consumo_conbinacion,
		ficha_detalle.forro,
		ficha_detalle.ancho_tela_forro,
		ficha_detalle.consumo_forro,
		ficha_tecnica.especificacionescostura,
		ficha_tecnica.tiempo_costura,
		ficha_tecnica.tiempo_acabados
from ficha_tecnica,
		ficha_detalle
where ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle				
GO

			
create view vistasalidadetalle
as
Select salidamaquiladetalle.id_salidadetalle,
		salidamaquiladetalle.idproduccion,
		salidamaquiladetalle.Fecha,
		salidamaquiladetalle.Modelo,
		salidamaquiladetalle.Mano_de_obra,
		salidamaquiladetalle.Prenda,
		salidamaquiladetalle.Tela,
		salidamaquiladetalle.Notas,
		salidamaquiladetalle.Especificaciones,
		salidamaquiladetalle.Pagare,
		salidamaquiladetalle.Maquilador,
		orden_produccion.id_cliente,
		clientes.nombre
from salidamaquiladetalle,
		orden_produccion,
		clientes
where salidamaquiladetalle.idproduccion=orden_produccion.id_orden and clientes.idclientes=orden_produccion.id_cliente
GO				

--create view VistaActivosMonitor
--as
--select orden_produccion.fecha_inicio as 'Entra Pedido',
--		orden_produccion.fecha_avios as 'Avios Completos',
--		orden_produccion.fecha_tela as 'Tela Completa',
--		orden_produccion.fecha_ruta as 'Rutas Establecidas',
--		orden_produccion.fecha_trazado_inicio as 'Empezo el trazado',
--		orden_produccion.fecha_trazado_terminado as 'Termino el trazado',
--		orden_produccion.fecha_tendido as 'Termina tendido',
--		orden_produccion.fecha_corte_inicio as 'Inicia Corte',
--		orden_produccion.fecha_corte_terminado as 'Termina Corte',
--		orden_produccion.fecha_separado_inicio as 'Inicio Separado',
--		orden_produccion.fecha_separado_terminado as 'Termina Separado',
--		orden_produccion.fecha_maquila_salida as 'Sale a maquila',
--		orden_produccion.fecha_maquila_entrada as 'Entrada Completa de Maquila',
--		orden_produccion.fecha_acabados_terminado as 'Acabados terminado'
--from orden_produccion
--where orden_produccion.Terminado is null
--GO					


							


create view solicitudclientes
as
select id_solicitud,
		idclientes,
		asunto,
		fecha,
		respondido,
		descripcion,
		nombre,
		costo_minuto
from solicitud,
		clientes
where solicitud.id_cliente=clientes.idclientes and solicitud.respondido=0
GO

create view Vclientefichas
as
select id_solicitud,
		idficha_tecnica,
		asunto,
		tiempo_costura,
		tiempo_acabados,
		costo_minuto,
		costo_metro,
		consumo_tela
from clientes,
	solicitud,
	ficha_tecnica,
	ficha_detalle
where ( ficha_tecnica.cliente=clientes.idclientes and ficha_tecnica.idsolicitud=solicitud.id_solicitud and solicitud.respondido=1 and ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle)
GO
				
create view vistasolicitudes 
as
select id_solicitud,
		asunto,
		fecha
from solicitud
GO

create view vernombressolicitudes
as
select nombre
from clientes
GO


create view vistasolicitudes2
as
select asunto as 'Asunto',
		fecha as 'Fecha Creado',
		respondido,
		fecharespuesta as 'Fecha de respuesta',
		descripcion as 'Descripcion', 
		id_cliente,
		id_solicitud
from solicitud,
		solicitudrespuesta
where id_solicitud=solicitud and respondido=0
GO

create view Vfichas_tecnicas
as
select nombre_prenda,
		modelo,
		tela,
		combinacion,
		consumo_conbinacion,
		forro,
		consumo_forro,
		tiempo_costura,
		tiempo_acabados,
		costo_minuto,
		costo_metro,
		consumo_tela,
		idficha_tecnica
from clientes,
	ficha_tecnica,
	ficha_detalle
where ( ficha_tecnica.cliente=clientes.idclientes and ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle)
GO


--create view ver_avios_ficha
--as
--select id_ficha,
--		nombre,
--		precio,
--		cantidad,
--		costo,
--		avios.id_avios
--from avios,
--		avios_detalle
--where ( avios_detalle.id_avio=avios.id_avios)
--GO

create view vista_avios_orden
as
select avios.id_avios,
avios_detalle.id_ficha,
avios.nombre,
avios_bodega.cantidad as cantidad_bodega,
avios_detalle.cantidad as cantidad_ficha
from avios,
avios_bodega,
avios_detalle
where avios_bodega.idavios=avios.id_avios and avios_detalle.id_avio=avios.id_avios
GO

create view ver_piezasficha
as
select id_ficha,
		nombre,
		cantidad,
		piezas.id_piezas
from piezas,
piezas_detalle
where ( piezas_detalle.id_pieza=piezas.id_piezas)
GO
create view acabados_fichas
as
select id_ficha,
		operacion,
		tipo,
		tiempo,
		cantidad,
		tiempo_total,
		id_acabados
from acabados,
	acabados_detalle
where id_acabados=id_acabdos
GO

create view procesosficha
as
select id_ficha,
		operacion,
		tiempo,
		id_proceso
from procesos,
	procesos_detalle
where id_proceso=id_procesos					
GO


create view ordenesvista_avios
as
select id_orden,
	idficha,
	asunto,
	tela,
	forro,
	consumo_forro,
	combinacion,
	consumo_conbinacion,
	id_cliente
from orden_produccion,
	produccion,
	ficha_detalle
where produccion.idorden=orden_produccion.id_orden and ficha_detalle.idficha_detalle=produccion.idficha and orden_produccion.avios_completo is null;
GO

create view ordenesvista_telas
as
select id_orden,
		idficha,
		asunto,
		tela,
		forro,
		consumo_forro,
		combinacion,
		consumo_conbinacion,
		id_cliente
from orden_produccion,
		produccion,
		ficha_detalle
where produccion.idorden=orden_produccion.id_orden and ficha_detalle.idficha_detalle=produccion.idficha and orden_produccion.tela_completa is null
GO

create view vistaproduccion_paracorte
as
select 	orden_produccion.id_orden as 'Produccion',
		orden_produccion.asunto as "Asunto",
		clientes.nombre as 'Cliente',
		ficha_detalle.modelo as 'Modelo',
		orden_produccion.observaciones,
		produccion.idficha
from orden_produccion,
		clientes,
		ficha_detalle,
		produccion
where orden_produccion.id_cliente=clientes.idclientes and produccion.idorden=orden_produccion.id_orden and produccion.idficha=ficha_detalle.idficha_detalle and orden_produccion.avios_completo=1 and orden_produccion.tela_completa=1 and orden_produccion.trazado_completo is null
GO

				


							