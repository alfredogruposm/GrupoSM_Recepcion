alter procedure catalogodealmacenexistenciasavios
as
Select Distinct vistaaviosalmacen.Nombre, SUM(vistaaviosalmacen.Cantidad) from vistaaviosalmacen
Group by Nombre
go 

alter procedure devuelvedatoscatalogoalmacenavios
@Nombre varchar(max) as
Select AviosAlmacen.IDAvio as 'ID',
		AviosAlmacen.Nombre,
		AviosAlmacen.Tipo
from AviosAlmacen
where Nombre=@nombre
GO

alter procedure ingresaalmacentela
@idproveedor int, @produccion int,
@nombre varchar(max),  @metros decimal(18, 2),
@composicion varchar(max), 
@color varchar(max), @ancho decimal(18, 2),
@fecha datetime as
insert into tela(proveedor, produccion, 
fecha_entrada, nombre_descripcion, metros,
composicion, color, ancho)
values(@idproveedor, @produccion, @nombre,
@fecha, @metros, @composicion, @color, @ancho)
GO

create procedure eliminaalmacenbodega
@idalmacen int as
delete from AviosAlmacen where IDAvioAlmacen=@idalmacen
delete from AviosAlmacen_Detalle where IDAvioAlmacen_Detalle=@idalmacen
GO

alter procedure insertaalmacendetalle
@idavio int, @produccion int, @cantidadficha decimal(18, 2) as
insert into avios_produccion(aviosid, producciondetalle, cantidad_necesaria,
cantidad_ficha) values (@idavio, @produccion, 0, @cantidadficha)
GO

create procedure actualizaavioscatalogo
@idavioproduccion int, @cantidadalmacen decimal(18, 2), @cantidadingreso decimal(18,2) 
as
update avios_produccion set cantidad_necesaria=@cantidadalmacen+@cantidadingreso
where idavios_produccion=@idavioproduccion
GO

create procedure insertacopiadebodegaprimeringreso
@idavio int, @cantidadficha decimal(18, 2) as
update avios_produccion set cantidad_necesaria=@cantidadficha
where idavios_produccion=@idavio
GO

create procedure insertaproducciondetalleavios
@iddetalleavios int, @color varchar(max), @talla varchar(max)
as
insert into ColorAvio(IDAviopro, Color, Talla) values 
(@iddetalleavios, @color, @talla)
GO

create procedure ingresacatalogo
@idavioalmacen int, @nombre varchar(max), @tipo varchar(max)
as
insert into AviosAlmacen(IDAvioAlmacen, Nombre, Tipo) values (@idavioalmacen, @nombre, @tipo)
GO

create procedure devuelvenumerodealmacen
as
select max(IDAvioAlmacen_Detalle) from AviosAlmacen_Detalle
GO

create procedure ingresaalmacen
@cantidad decimal(18, 2), @produccion int
as 
insert into AviosAlmacen_Detalle(IDProduccion, Cantidad) values (@produccion, @cantidad)
GO

create procedure eliminaentradabodega
@idaviobodega int as
delete from AviosAlmacen_Detalle where IDAvioAlmacen_Detalle=@idaviobodega
delete from AviosAlmacen where IDAvioAlmacen=@idaviobodega
GO

alter procedure devuelvetelasportipo
@idproduccion int, @tipo int as
select tela.nombre_descripcion as 'Nombre',
		tela.fecha_entrada as 'Fecha',
		tela.metros as 'Metros',
		tela.composicion as 'Composicion',
		tela.color as 'Color',
		tela.ancho as 'Ancho'
from tela
where tela.produccion=@idproduccion and tela.tipo=@tipo 
GO


create procedure devuelvetallasavios
@idproduccion int as
select talla, color, cantidad_prendas from produccion_detalle where produccion_detalle.producionid=@idproduccion
GO

create procedure devuelvealmacenavios01
as
Select distinct AviosAlmacen.Nombre from AviosAlmacen
GO

create procedure devuelvetelasproduccion
@idproduccion int as
select produccion_detalle.tela as 'Tela',
		produccion_detalle.combinacion as 'Combinacion',
		produccion_detalle.forro as 'Forro',
		produccion_detalle.color as 'Color',
		produccion_detalle.metros_recibidos as 'Metros Tela',
		produccion_detalle.metros_recibidoscombinacion as 'Metros Combinacion',
		produccion_detalle.metros_recibidosforro as 'Metros Forro',
		produccion_detalle.num_tela_rollo as 'Ancho tela',
		produccion_detalle.num_combinacion_rollo as 'Ancho Combinacion',
		produccion_detalle.numeroforro_rollo as 'Ancho Forro'
from produccion_detalle
where produccion_detalle.producionid=@idproduccion
GO

create procedure devuelvedatosalmacenavios
@nombre varchar(max) as
select AviosAlmacen.Tipo, 
		AviosAlmacen.IDAvioAlmacen as 'Clave', 
		AviosAlmacen_Detalle.IDAvioAlmacen_Detalle as 'ID' 
from AviosAlmacen,
	AviosAlmacen_Detalle
where AviosAlmacen.Nombre=@nombre and AviosAlmacen_Detalle.IDAvioAlmacen_Detalle=AviosAlmacen.IDAvioAlmacen
GO


create procedure devuelvenumaviosdetallealmacen
as
select max(IDAvioAlmacen_Detalle) from AviosAlmacen_Detalle
GO

create procedure devuelveavioshojacortee
@idproduccion int as
select AviosAlmacen_Detalle.IDProduccion as 'Orden',
		AviosAlmacen.Nombre,
		AviosAlmacen_Detalle.Cantidad,
	    AviosAlmacen_Detalle.IDAvioAlmacen_Detalle as 'ID'
from AviosAlmacen,
	AviosAlmacen_Detalle
where AviosAlmacen.IDAvioAlmacen=AviosAlmacen_Detalle.IDAvioAlmacen_Detalle and AviosAlmacen_Detalle.IDProduccion=@idproduccion
GO
		

create procedure eliminaaviosalmacen
@idavio int as
delete from AviosAlmacen where IDAvio=@idavio
GO

create procedure devuelvetelascosteo
@IDCosteo int as 
select telacosteo.nombre as 'Nombre',
		TelaCosteo_Detalle.Ancho,
		telacosteo.precio as 'Precio',
		TelaCosteo_Detalle.Tipo
from telacosteo,
		TelaCosteo_detalle
where telacosteo.idtelas=TelaCosteo_Detalle.IDTelaCosteo and TelaCosteo_Detalle.IDCosteo=@IDCosteo
GO
create procedure devuelvecosteoimpresion
@idcosteo int as
select IDCosteo,
		Fecha, 
		CobroMinuto,
		CostoAvios,
		CostoMetros,
		CostoVenta,
		CostoMaquila,
		Comision,
		PrecioMaquila,
		PrecioVenta,
		TiempoAcabados,
		TiempoCostura,
		ficha_detalle.nombre_prenda as 'Prenda',
		ficha_detalle.modelo as 'Modelo',
		clientes.nombre as 'Cliente',
		ficha_tecnica.cliente as 'IDCliente'
from ficha_tecnica,
	ficha_detalle,
	Costeo,
	Clientes
where ficha_detalle.idficha_detalle=Costeo.IDFichaTecnica and ficha_tecnica.cliente=clientes.idclientes and 
ficha_tecnica.idficha_detalle=ficha_detalle.idficha_detalle
and Costeo.IDFichaTecnica=ficha_tecnica.idficha_tecnica and Costeo.IDCosteo=@IDCosteo
GO 
		
create procedure devuelvecosteos
@idficha int as
select Fecha, 
		CobroMinuto,
		CostoAvios,
		CostoMetros,
		CostoVenta,
		CostoMaquila,
		Comision,
		PrecioMaquila,
		PrecioVenta,
		TiempoAcabados,
		TiempoCostura,
		IDCosteo
from Costeo where IDFichaTecnica=@idficha
Go

create procedure respaldabasededatos 
@fecha datetime as
BACKUP DATABASE [GrupoSM] TO  DISK = N'E:\Shares\ArchivosServidor\Dropbox\Dropbox\GrupoSMRespaldoBD.bak' WITH FORMAT, INIT,  MEDIANAME = N'GrupoSMDB',  NAME = N'GrupoSM-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
declare @backupSetId as int
select @backupSetId = position from msdb..backupset where database_name=N'GrupoSM' and backup_set_id=(select max(backup_set_id) from msdb..backupset where database_name=N'GrupoSM' )
if @backupSetId is null begin raiserror(N'Verify failed. Backup information for database ''GrupoSM'' not found.', 16, 1) end
RESTORE VERIFYONLY FROM  DISK = N'E:\Shares\ArchivosServidor\Dropbox\Dropbox\GrupoSMRespaldoBD.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
insert into BitacoraRespaldos values (@fecha)
GO

create procedure devuelveidrespaldo
as
select max(BitacoraRespaldos.IDRespaldo) from BitacoraRespaldos
GO

create procedure devuelvebitacorarespaldo
@idrespaldo int as
select * from BitacoraRespaldos where IDRespaldo=@idrespaldo
GO
-----------------------------------------------------------------------------------------------------------------------------------

--CREATE procedure insertanuevos_aviosproduccion
--@idavio as int, @produccionid as int, @cantidad as float as
--insert into avios_produccion values(@idavio, @produccionid, @cantidad)
--GO


---------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------Clientes---------------------------------------------------------		

create procedure borra_cliente
@idcliente int as
delete from clientes where idclientes=@idcliente
GO

CREATE procedure devuelvecliente
@idcliente as int as
select * from clientes where idclientes=@idcliente
GO

CREATE procedure actualizacliente
@idcliente as int, @nombre as varchar(max), @costo as float, @costometro as float as
update clientes set nombre=@nombre, costo_minuto=@costo, costo_metro=@costometro where idclientes=@idcliente 
GO

CREATE procedure actualiza_clientefichatecnica
@idficha as int, @idcliente as int as
update ficha_tecnica set cliente=@idcliente where idficha_detalle=@idficha
GO		
							
---------------------------------------------------------------PROVEEDOR---------------------------------------------------------
CREATE procedure actualiza_proveedor
@idproveedor as int, @nombre as varchar(max) as
update proveedor set nombre=@nombre where idproveedor=@idproveedor
GO						


create procedure borra_proveedor
@idproveedor int as 
delete from proveedor where idproveedor=@idproveedor
GO

---------------------------------------------------------------maquiladores---------------------------------------------------------
CREATE procedure actualizamaquiladores
@idmaquila as int, @nombr as varchar(max), @preciominuto as float as
update maquiladores set nombre=@nombr, precio_minuto=@preciominuto where idmaquiladores=@idmaquila
GO


create procedure borra_maquilador
@idmaquilador int as
delete from maquiladores where idmaquiladores=@idmaquilador
GO
---------------------------------------------------------------solicitud---------------------------------------------------------

create procedure impresioncosteo 
@idsolicitud int as
Select solicitud.asunto,
solicitud.descripcion,
solicitud.fecha,
clientes.nombre
from solicitud,
clientes
where solicitud.id_solicitud=@idsolicitud and clientes.idclientes=solicitud.id_cliente
GO

CREATE procedure establece_solicitudrespondida
@idsolicitud as int as
update solicitud set respondido=1 where id_solicitud=@idsolicitud
GO

CREATE procedure actualizasolicitud
@id_solicitud as int, @idcliente as int, @asuntos as varchar(max), @descripciones as varchar(max) as
update solicitud set id_cliente=@idcliente, asunto=@asuntos, descripcion=@descripciones where id_solicitud=@id_solicitud				 
GO

CREATE procedure solicitudesrespondidas
as
select * from solicitud where respondido=1
GO

CREATE procedure devuelvesolicitud
@idsolic as int as
select * from solicitud where id_solicitud=@idsolic
GO

CREATE procedure versolicitudes
as
select * from vistasolicitudes
GO

CREATE procedure respuestasolicitud
@idsolicitud int, @fecha datetime as
if EXISTS(select * from solicitudrespuesta where solicitud=@idsolicitud)
UPDATE solicitudrespuesta set fecharespuesta=@fecha where solicitud=@idsolicitud
else
insert into solicitudrespuesta values(@idsolicitud, @fecha)
GO

CREATE procedure creasolicitudrespuesta
@idsolicitud int as 
insert into solicitudrespuesta(solicitud) values(@idsolicitud)
GO

CREATE procedure numerosolicitud
as
select MAX(id_solicitud) from solicitud;
GO

---------------------------------------------------------------Fichas---------------------------------------------------------

create procedure devuelvetiempodecostura
@idficha int as
select tiempo_costura from ficha_tecnica where idficha_tecnica=@idficha
Go

CREATE procedure actualiza_fichadetalle
@idficha_detalle as int, @nombreprenda as varchar(max), @modelo varchar(max),
@tela as varchar(max),
@ancho_tela as float,
@consumo_tela as float,
@combinacion as varchar(max),
@ancho_tela_conbinacion as float,
@consumo_conbinacion as float,
@forro as varchar(max),
@ancho_tela_forro as float,
@consumo_forro as float as
update ficha_detalle set nombre_prenda=@nombreprenda, modelo=@modelo, tela=@tela, ancho_tela=@ancho_tela,
consumo_tela=@consumo_tela, combinacion=@combinacion, ancho_tela_conbinacion=@ancho_tela_conbinacion,
consumo_conbinacion=@consumo_conbinacion,
forro=@forro,
ancho_tela_forro=@ancho_tela_forro,
consumo_forro=@consumo_forro where idficha_detalle=@idficha_detalle
GO

CREATE procedure regresa_fichatecnica_vista2
@idficha as int as 
select * from Vfichas_tecnicas2 where idficha_tecnica=@idficha;
GO

CREATE procedure numerofichatecnica
as
select MAX(idficha_detalle) from ficha_detalle;
GO

CREATE procedure actualizafichatecnica_parcial
@idficha as int, @especificaiones as varchar(max), @tiempocostura as float, @tiempoacabados as float, @costeo as float as
update ficha_tecnica set especificacionescostura=@especificaiones, tiempo_costura=@tiempocostura, tiempo_acabados=@tiempoacabados, costeo=@costeo where idficha_tecnica=@idficha
GO

CREATE procedure creafichaparcial
@iddetalle as int, @idcliente as int as
insert into ficha_tecnica(idficha_detalle, cliente) values(@iddetalle, @idcliente)							
GO
						
CREATE procedure creafichaparcial_solicitud
@iddetalle as int, @idcliente as int, @solicitud as int as
insert into ficha_tecnica(idficha_detalle, idsolicitud, cliente) values(@iddetalle, @solicitud, @idcliente)	
GO

CREATE procedure borra_tablas_ficha
@idficha as int as
delete from acabados_detalle where id_ficha=@idficha
delete from procesos_detalle where id_ficha=@idficha
delete from piezas_detalle where id_ficha=@idficha
delete from avios_detalle where id_ficha=@idficha
delete from ficha_tecnica where idficha_tecnica=@idficha
delete from ficha_detalle where idficha_detalle=@idficha
GO


--CREATE procedure respondidosvistafichas
--as
--select * from Vclientefichas where respondido=1

--GO


CREATE procedure fichassolicitud
@idsolicitud as int as
select * from ficha_tecnica where idsolicitud=@idsolicitud
GO



create procedure ver_especificacionesficha
@idficha int as
select * from especificacionesficha where especificacionesficha.fichatecnica=@idficha
GO

create procedure insertaespecificacionesfichatecnica
@idficha int, @especificaciones varchar(max) as
if EXISTS(select * from especificacionesficha where fichatecnica=@idficha)
UPDATE especificacionesficha set Especificaciones=@especificaciones where fichatecnica=@idficha
else
insert into especificacionesficha(fichatecnica, Especificaciones) values(@idficha, @especificaciones)
GO

--create procedure insertaespecificacionesfichatecnica
--@idficha int, @especificaciones varchar(max) as
--if EXISTS(select * from especificacionesficha where fichatecnica=@idficha)
--return 0
--else
--insert into especificacionesficha(fichatecnica, Especificaciones) values(@idficha, @especificaciones)
--GO

						
---------------------------------------------------------------Avios---------------------------------------------------------

CREATE procedure numeroavios
as
select MAX(id_avios) from avios;
GO

CREATE procedure actualiza_avios
@idavios as int, @nombres as varchar(max), @tipo as int, @precio as float as
update avios set nombre=@nombres, tipo=@tipo, precio=@precio where id_avios=@idavios
GO

create procedure actualiza_bodegaavios
@idbodagaavio as int, @cantidad as float as
update avios_bodega set cantidad=@cantidad where idavios=@idbodagaavio;
GO

CREATE procedure comprueba_existencia_aviosproduccion 
@id_produccion int 
as
IF EXISTS(SELECT * FROM avios_produccion WHERE producciondetalle = @id_produccion) 
return 1
ELSE
return 0;
GO

CREATE procedure Existen_aviosproduccion
@idproduccion as int as
DECLARE @return_status int;
EXEC @return_status = comprueba_existencia_aviosproduccion @idproduccion;
SELECT 'Return_Status' = @return_status;
GO

CREATE procedure busca_aviostipo
@tipo as int as
select * from avios where tipo=@tipo
GO

CREATE procedure borra_aviosficha
@idavio as int, @idficha as int as 
delete from avios_detalle where id_ficha=@idficha and id_avio=@idavio
GO

CREATE procedure insertaficha_avios
@idficha as int, @idavio as int, @cantidad as float, @costo as float as
if EXISTS(select * from avios_detalle where id_ficha=@idficha and id_avio=@idavio)
UPDATE avios_detalle SET cantidad=@cantidad, costo=@costo where id_ficha=@idficha and id_avio=@idavio
ELSE
insert into avios_detalle values(@idficha, @idavio, @cantidad, @costo);
GO

create procedure verificaordenavios 
@idproduccion as int, @idficha as int, @fecha datetime as	
if EXISTS(select avios.nombre,
avios_bodega.cantidad as cantidad_bodega,
avios_detalle.cantidad as cantidad_ficha,
avios_produccion.cantidad_necesaria,
avios.id_avios,
avios_detalle.id_ficha
from avios,
avios_bodega,
avios_detalle,
avios_produccion
where avios_bodega.idavios=avios.id_avios and avios_detalle.id_avio=avios.id_avios and avios_produccion.aviosid=avios.id_avios and avios_produccion.producciondetalle=@idproduccion and avios_detalle.id_ficha=@idficha and avios_produccion.cantidad_necesaria!=0)
return 0
else
update orden_produccion set avios_completo=1, fecha_avios=@fecha where id_orden=@idproduccion
GO	

					
create procedure devuelvesalidaavios
@produccion int as
select texto1 as 'Avio', texto2 as 'Descripcion', id_salidaavios as 'ID' from salidadetalleavios where idproduccion=@produccion
GO

create procedure eliminadetallesalidaavios
@idsalida int as
delete from salidadetalleavios where id_salidaavios=@idsalida
GO

create procedure devuelveaviosproduccion
@idproduccion int as
select * from avios_produccion where producciondetalle=@idproduccion
GO


Create procedure actualizaavioproduccionsubgrupo
@idavioproduc int, @idavio int as
update avios_produccion set aviosid=@idavio where idavios_produccion=@idavioproduc
GO



CREATE procedure busca_tipo_aviosmasbodega
@tipo as int as
select * from avios_mas_bodega where tipo=@tipo						
GO

create procedure devuelvevistabodegaaviostipo2
@tipo int as
Select *
from vistabodegaavios2
where vistabodegaavios2.tipo=@tipo
GO

create procedure busca_aviostipoBASEPortipo
@tipo int
as
select avios.id_avios,
avios.nombre,
avios.precio
from avios,
avios_bodega where avios.id_avios=avios_bodega.idavios and avios_bodega.cantidad=0 and avios.tipo=@tipo and precio!=0			
GO

create procedure busca_aviostipoBASE
as
select avios.id_avios,
avios.nombre,
avios.precio
from avios,
avios_bodega where avios.id_avios=avios_bodega.idavios and avios_bodega.cantidad=0 and precio!=0	
GO

Create procedure devuelvesubgruposcolor
@idavio int as
Select avios.id_avios as 'ID',
avios.nombre as 'Nombre',
AviosSubgrupos.IDAviosSubGrupo as 'ID SubAvio'
from avios,
AviosSubgrupos
where AviosSubgrupos.IDAvioPrincipal=@idavio and avios.id_avios=AviosSubgrupos.IDAvioSubColor		
GO

Create procedure eliminaaviossubgrupos
@idavio int as
delete from AviosSubgrupos where IDAviosSubGrupo=@idavio
GO

alter procedure actualiza_bodega_asignaciones
@idproduccion as int, @cantidad_asignada as decimal(18, 2), @idaviosproc int as
update avios_produccion set cantidad_necesaria=@cantidad_asignada where avios_produccion.idavios_produccion=@idaviosproc
GO

create procedure actualizabodegaavios
@aviosid int, @cantidad int as
update avios_bodega set cantidad+=@cantidad where idavios=@aviosid
GO

create procedure devuelvenumeroavioprod
as
select MAX(idavios_produccion) from avios_produccion;
GO

create procedure actualizaavioproduccionalmacen
@idavioprod int, @cantidad decimal(18,2) as
update avios_produccion set cantidad_necesaria+=@cantidad where idavios_produccion=@idavioprod
GO

create procedure avios_vistaasignacion
@idproduccion int as
Select avios.nombre as 'Nombre',
ColorAvio.Color,
avios_produccion.cantidad_necesaria as 'Almacen',
avios_produccion.cantidad_ficha as 'Requerido',
avios_produccion.idavios_produccion as 'Clave',
avios_produccion.aviosid as 'ID'
From avios,
avios_produccion,
ColorAvio
where avios_produccion.producciondetalle=@idproduccion and ColorAvio.IDAviopro=avios_produccion.idavios_produccion and 
avios.id_avios=avios_produccion.aviosid 
GO

create procedure numeroaviosproduccion
as
select MAX(idavios_produccion) from avios_produccion
GO


create procedure eliminaaviosproduccion
@idorden int as
delete from avios_produccion where producciondetalle=@idorden
update orden_produccion set avios_completo=null, fecha_avios=null where id_orden=@idorden
GO

CREATE procedure ver_avios_fichas
@ficha as int as
select * from ver_avios_ficha where id_ficha=@ficha
GO

create procedure avios_orden_asignaciones
@idproduccion as int as
select avios.nombre,
avios_bodega.cantidad as cantidad_bodega,
avios_produccion.cantidad_ficha,
avios_produccion.cantidad_necesaria,
avios.id_avios
from avios,
avios_bodega,
avios_produccion
where avios_bodega.idavios=avios.id_avios and avios_produccion.aviosid=avios.id_avios and avios_produccion.producciondetalle=@idproduccion and avios_produccion.cantidad_necesaria>0
GO

create procedure devuelveavios_plantilla
@idplantilla int as
select aviosplantilla.id_avio as 'ID',
avios.nombre as 'Nombre',
aviosplantilla.cantidad as 'Cantidad',
aviosplantilla.costo as 'Costo'
from avios,
aviosplantilla
where aviosplantilla.IDplantilla=@idplantilla and avios.id_avios=aviosplantilla.id_avio
GO

create procedure insertaplantilla_avios
@idplantilla as int, @idavio as int, @cantidad as float, @costo as float as
if EXISTS(select * from aviosplantilla where IDplantilla=@idplantilla and id_avio=@idavio)
UPDATE aviosplantilla SET cantidad=@cantidad, costo=@costo where IDplantilla=@idplantilla and id_avio=@idavio
ELSE
insert into aviosplantilla values(@idplantilla, @idavio, @cantidad, @costo);
GO

create procedure eliminaplantilla_avios
@idplantilla int, @idavio int as
delete from aviosplantilla where IDplantilla=@idplantilla and id_avio=@idavio
GO


create procedure avios_impresion
@idproduccion int as
Select avios.nombre as 'Avio',
avios.precio as 'Precio Unitario',
avios_produccion.cantidad_ficha as 'Cantidad por prenda',
avios_produccion.cantidad_necesaria as 'Cantidad bodega',
ColorAvio.Color, 
ColorAvio.Talla
from avios,
avios_produccion,
ColorAvio
where avios.id_avios=avios_produccion.aviosid and 
avios_produccion.producciondetalle=@idproduccion and ColorAvio.IDAviopro=avios_produccion.idavios_produccion
GO
---------------------------------------------------------------Piezas---------------------------------------------------------

CREATE procedure actualizapiezas
@idpieza as int, @tipo as int, @nombre as varchar(max) as
update piezas set tipo=@tipo, nombre=@nombre where id_piezas=@idpieza
GO

CREATE procedure ver_piezas_ficha
@ficha as int as 
select * from piezas
GO

CREATE procedure busca_piezastipo
@tipo as int as
select * from piezas where tipo=@tipo
GO

CREATE procedure borra_piezasficha
@idpieza as int, @idficha as int as 
delete from piezas_detalle where id_ficha=@idficha and id_pieza=@idpieza
GO
	
CREATE procedure verpiezas_ficha
@idficha as int as
select * from ver_piezasficha where id_ficha=@idficha
GO

CREATE procedure insertaficha_piezas
@idficha as int, @idpieza as int, @cantidad as float as
if EXISTS(select * from piezas_detalle where id_ficha=@idficha and id_pieza=@idpieza)
UPDATE piezas_detalle SET cantidad=@cantidad where id_ficha=@idficha and id_pieza=@idpieza
ELSE
insert into piezas_detalle values(@idficha, @idpieza, @cantidad);
GO

CREATE procedure borra_pieza
@idpieza as int as
delete from piezas where id_piezas=@idpieza					
GO

create procedure devuelvetrabajoseparado
@orden int as
select * from trabajoseparadohojacorte 
where trabajoseparadohojacorte.Orden=@orden
GO

--------------------------------------------------------------acabados---------------------------------------------------------

CREATE procedure actualizaacabados
@idacabado as int, @nombre as varchar(max), @tipos as int, @tiempo as float as
update acabados set operacion=@nombre, tipo=@tipos, tiempo=@tiempo where id_acabados=@idacabado
GO

CREATE procedure busca_acabadostipo
@tipo as int as
select * from acabados where tipo=@tipo
GO

CREATE procedure borra_acabadosficha
@idacabado as int, @idficha as int as 
delete from acabados_detalle where id_ficha=@idficha and id_acabdos=@idacabado
GO

CREATE procedure veracabados_fichas
@idficha int as
select * from acabados_fichas where id_ficha=@idficha
GO

create procedure insertaficha_acabados
@idficha as int, @idacabado as int, @cantidad as float, @tiempo as decimal(18, 2) as
if EXISTS(select * from acabados_detalle where id_ficha=@idficha and id_acabdos=@idacabado)
UPDATE acabados_detalle SET cantidad=@cantidad, tiempo_total=@tiempo where id_ficha=@idficha and id_acabdos=@idacabado
ELSE
insert into acabados_detalle values(@idficha, @idacabado, @cantidad, @tiempo);
GO

CREATE procedure borra_acabado
@idacabado as int as
delete from acabados where id_acabados=@idacabado
GO

---------------------------------------------------------------procesos---------------------------------------------------------
CREATE procedure actualizaprocesos
@idproceso as int, @nombre as varchar(max), @tipos as int, @tiempo as float as
update procesos set operacion=@nombre, tipo=@tipos, tiempo=@tiempo where id_procesos=@idproceso
GO

CREATE procedure busca_procesostipo
@tipo as int as
select * from procesos where tipo=@tipo
GO

CREATE procedure borra_procesosficha
@idproceso as int, @idficha as int as 
delete from procesos_detalle where id_ficha=@idficha and id_proceso=@idproceso
GO

create procedure verprocesosficha
@idficha int as 
select id_ficha,
operacion,
tiempo,
id_proceso
from procesos,
procesos_detalle
where id_proceso=id_procesos and id_ficha=@idficha
order by procesos_detalle.id_procesos_detalle
GO

CREATE procedure insertaficha_procesos
@idficha as int, @idproceso as int as
if EXISTS(select * from procesos_detalle where id_ficha=@idficha and id_proceso=@idproceso)
return 0
ELSE
insert into procesos_detalle values(@idficha, @idproceso);
GO

CREATE procedure borra_proceso
@idproceso as int as 
delete from procesos where id_procesos=@idproceso
GO
				
---------------------------------------------------------------produccion---------------------------------------------------------

create procedure devuelveproduccion_detalle
@idproduccion int as
select * from produccion_detalle where producionid=@idproduccion
GO

create procedure vistahojacorte1
@idproduccion int as
select orden_produccion.id_cliente,
produccion.idorden,
clientes.nombre,
orden_produccion.asunto,
orden_produccion.observaciones,
produccion.observaciones_diseño,
Vistafichastecnicascompleta.modelo,
Vistafichastecnicascompleta.tela,
Vistafichastecnicascompleta.ancho_tela,
Vistafichastecnicascompleta.consumo_tela,
Vistafichastecnicascompleta.combinacion,
Vistafichastecnicascompleta.ancho_tela_conbinacion,
Vistafichastecnicascompleta.consumo_conbinacion,
Vistafichastecnicascompleta.forro,
Vistafichastecnicascompleta.ancho_tela_forro,
Vistafichastecnicascompleta.consumo_forro,
Vistafichastecnicascompleta.idficha_tecnica,
especificacionesficha.Especificaciones
from orden_produccion,
produccion,
Vistafichastecnicascompleta,
clientes,
especificacionesficha
where clientes.idclientes=orden_produccion.id_cliente and produccion.idorden=orden_produccion.id_orden and Vistafichastecnicascompleta.idficha_tecnica=produccion.idficha and orden_produccion.id_orden=@idproduccion and especificacionesficha.fichatecnica=Vistafichastecnicascompleta.idficha_tecnica
GO

CREATE procedure actualiza_prendas_devoluciones
@produccion int, @prendas int as
update salida_maquila set prendas_recibidas+=@prendas where id_producciondetalle=@produccion
GO	


create procedure devuelvenumeroprendascolor
@idproduccion int, @color varchar(max) as
Select SUM(produccion_detalle.cantidad_prendas) as Cantidad_prendas
FROM produccion_detalle
WHERE producionid=@idproduccion and color=@color
GO

							
create procedure producciondetalle_preliminar2
@idproducciondetalle int as
select produccion_detalle.tela,
		produccion_detalle.talla,
		produccion_detalle.color,
		produccion_detalle.combinacion,
		produccion_detalle.cantidad_prendas
from    produccion_detalle
where producionid=@idproducciondetalle
Order By Case talla
When 'XS' Then 1
When 'CH\M' Then 1
When 'U' Then 1
When 'S' Then 2
When 'M\G' Then 2
When 'M' Then 3
When 'L' Then 4
When 'XL' Then 5
When '2XL' Then 6
Else 7 END
GO
							
CREATE procedure prendas_entrada
@idproducciondetalle as int as
select id_produccion_detalle as 'ID',
		tela,
		talla,
		color,
		combinacion,
		cantidad_prendas as 'Cantidad Enviada',
		cantidad_prendas_final as 'Cantidad Recibida'
from    produccion_detalle
where producionid=@idproducciondetalle
GO
				
				
				
		


create procedure elimina_ordenproduccion
@idproduccion int as
DELETE FROM tela where produccion=@idproduccion
DELETE FROM produccion_detalle where producionid=@idproduccion
DELETE FROM avios_produccion where producciondetalle=@idproduccion
DELETE FROM produccion where idorden=@idproduccion
DELETE FROM orden_produccion where id_orden=@idproduccion
GO


create procedure devuelvesalidadetalle
@idproduccion int as
select * from vistasalidadetalle where idproduccion=@idproduccion
GO
create procedure salidamaquilainsert
@idproduccion int, @maquilador int, @prendasenviadas float, @manoobra float as
if EXISTS(select * from salida_maquila where id_producciondetalle=@idproduccion)
UPDATE salida_maquila set maquilador=@maquilador, prendas_enviadas=@prendasenviadas, mano_obra=@manoobra where id_producciondetalle=@idproduccion
else
insert into salida_maquila(id_producciondetalle, maquilador, prendas_enviadas, mano_obra) values(@idproduccion, @maquilador, @prendasenviadas, @manoobra)
GO
							
create procedure actualiza_prendasalidamaquila
@idorden int, @maquilador int, @enviadas int, @manobra float as
update orden_produccion set en_maquila=1, fecha_maquila_salida=CURRENT_TIMESTAMP
exec salidamaquilainsert @idorden, @maquilador, @enviadas, @manobra
update produccion_detalle set cantidad_prendas_final=0 where producionid=@idorden
GO							

CREATE procedure salidamaquiladetalleinsert
@idproduccion int, @fecha datetime, @modelo varchar(max), @manoobra decimal(18, 2), @prenda varchar(max), @tela varchar(max), @notas varchar(max), @especificaciones varchar(max), @pagare varchar(max), @maquilador varchar(max) as
if EXISTS(select * from salidamaquiladetalle where idproduccion=@idproduccion)
UPDATE salidamaquiladetalle set Modelo=@modelo, Mano_de_obra=@manoobra, Prenda=@prenda, Tela=@tela, Notas=@notas, Especificaciones=@especificaciones, Pagare=@pagare, Maquilador=@maquilador
else
insert into salidamaquiladetalle values(@idproduccion, @fecha, @modelo, @manoobra, @prenda, @tela, @notas, @especificaciones, @pagare, @maquilador)
GO

create procedure datos_orden_reporteCompleto
@idproduccion int as
select * from ordenesvista where id_orden=@idproduccion
GO



create procedure datos_orden_reporte
@idproduccion int as
select * from ordenesvista where id_orden=@idproduccion
GO

CREATE procedure datos_cantidadprendas_orden
@idorden as int as
SELECT SUM(cantidad_prendas) as 'Numero de prendas'
FROM produccion_detalle
WHERE producionid=@idorden
GO		






create procedure elimina_ordenproduccion
@idproduccion int as
DELETE FROM tela where produccion=@idproduccion
DELETE FROM produccion_detalle where producionid=@idproduccion
DELETE FROM avios_produccion where producciondetalle=@idproduccion
DELETE FROM produccion where idorden=@idproduccion
DELETE FROM orden_produccion where id_orden=@idproduccion
GO


create procedure devuelvesalidadetalle
@idproduccion int as
select * from vistasalidadetalle where idproduccion=@idproduccion
GO
create procedure salidamaquilainsert
@idproduccion int, @maquilador int, @prendasenviadas float, @manoobra float as
if EXISTS(select * from salida_maquila where id_producciondetalle=@idproduccion)
UPDATE salida_maquila set maquilador=@maquilador, prendas_enviadas=@prendasenviadas, mano_obra=@manoobra where id_producciondetalle=@idproduccion
else
insert into salida_maquila(id_producciondetalle, maquilador, prendas_enviadas, mano_obra) values(@idproduccion, @maquilador, @prendasenviadas, @manoobra)
GO
							
create procedure actualiza_prendasalidamaquila
@idorden int, @maquilador int, @enviadas int, @manobra float as
update orden_produccion set en_maquila=1, fecha_maquila_salida=CURRENT_TIMESTAMP
exec salidamaquilainsert @idorden, @maquilador, @enviadas, @manobra
update produccion_detalle set cantidad_prendas_final=0 where producionid=@idorden
GO							

CREATE procedure salidamaquiladetalleinsert
@idproduccion int, @fecha datetime, @modelo varchar(max), @manoobra decimal(18, 2), @prenda varchar(max), @tela varchar(max), @notas varchar(max), @especificaciones varchar(max), @pagare varchar(max), @maquilador varchar(max) as
if EXISTS(select * from salidamaquiladetalle where idproduccion=@idproduccion)
UPDATE salidamaquiladetalle set Modelo=@modelo, Mano_de_obra=@manoobra, Prenda=@prenda, Tela=@tela, Notas=@notas, Especificaciones=@especificaciones, Pagare=@pagare, Maquilador=@maquilador
else
insert into salidamaquiladetalle values(@idproduccion, @fecha, @modelo, @manoobra, @prenda, @tela, @notas, @especificaciones, @pagare, @maquilador)
GO

create procedure datos_orden_reporteCompleto
@idproduccion int as
select * from ordenesvista where id_orden=@idproduccion
GO



create procedure datos_orden_reporte
@idproduccion int as
select * from ordenesvista where id_orden=@idproduccion
GO

CREATE procedure datos_cantidadprendas_orden
@idorden as int as
SELECT SUM(cantidad_prendas) as 'Numero de prendas'
FROM produccion_detalle
WHERE producionid=@idorden
GO		
CREATE procedure actualiza_prendamaquila
@idorden int as
update orden_produccion set separado=1, fecha_separado_terminado=CURRENT_TIMESTAMP
GO






CREATE procedure actualiza_prendamaquila
@idorden int as
update orden_produccion set separado=1, fecha_separado_terminado=CURRENT_TIMESTAMP
GO		
				
				
							
CREATE procedure prendas_termina_maquila
@idorden int as
update orden_produccion set fecha_maquila_entrada=CURRENT_TIMESTAMP, acabados=1 where id_orden=@idorden
GO

CREATE procedure prendas_termina_acabados
@idorden int as
update orden_produccion set fecha_acabados_terminado=CURRENT_TIMESTAMP, calidad=1 where id_orden=@idorden
GO		

CREATE procedure prendas_terminacalidad
@idproduccion int as 
update orden_produccion set fecha_acabados_inicio=CURRENT_TIMESTAMP, Terminado=1 where id_orden=@idproduccion
GO

CREATE procedure prenda_termina_entrega
@idproduccion int as
update orden_produccion set fecha_entrega=CURRENT_TIMESTAMP where id_orden=@idproduccion
GO



CREATE procedure numeroproduccion
as
select MAX(id_orden) from orden_produccion;
GO

CREATE procedure ingresa_produccionparcial
@idorden as int, @idficha as int as
insert into produccion(idorden, idficha) values(@idorden, @idficha);
GO

CREATE procedure ingresa_ordenparcial
@idcliente as int, @asunto as varchar(max) as
insert into orden_produccion(id_cliente, asunto) values(@idcliente, @asunto)
GO

CREATE procedure borra_orden_produccion
@idorden as int as
delete from produccion_detalle where producionid=@idorden
delete from avios_produccion where producciondetalle=@idorden
delete from produccion where idorden=@idorden
delete from orden_produccion where id_orden=@idorden
GO

CREATE procedure actualizaobservaciones_orden
@idorden as int, @observaciones as varchar(max) as
update orden_produccion set observaciones=@observaciones where id_orden=@idorden
GO

CREATE procedure cantidadprendas_orden
@idorden as int as
SELECT SUM(cantidad_prendas)
FROM produccion_detalle
WHERE producionid=@idorden
GO

create procedure producciondetalle_preliminar
@idproducciondetalle as int as
select tela,
talla,
color,
combinacion,
cantidad_prendas,
metros_recibidos,
num_tela_rollo,
num_combinacion_rollo
from    produccion_detalle
where producionid=@idproducciondetalle
order by produccion_detalle.talla
GO

CREATE procedure ver_produccion_detalle
@idorden as int as
select * from produccion_detalle where producionid=@idorden
GO

create procedure ingresa_producciondetalle_parcial
@idproduccion as int, 
@tela as varchar(max),
@combinacion as varchar(max),
@numtelarollo int,
@numerocombinacionrollo int, 
@talla as varchar(32),
@color as varchar(max),
@metrosrecibidos as float,
@cantidadprendas as float,
@forro varchar(max),
@metrosrecibidos_forro decimal(18, 2),
@metrosrecibidos_combinacion decimal(18, 2),
@numerollo_forro int as
insert into produccion_detalle(producionid, 
tela, combinacion, num_tela_rollo, num_combinacion_rollo,
talla, color, 
metros_recibidos,
cantidad_prendas, 
forro, metros_recibidosforro,
metros_recibidoscombinacion,
numeroforro_rollo) 
values(@idproduccion, @tela, @combinacion,
@numtelarollo,
@numerocombinacionrollo, 
@talla, @color, @metrosrecibidos, 
@cantidadprendas, @forro, @metrosrecibidos_forro,
@metrosrecibidos_combinacion,
@numerollo_forro)
GO

create procedure actualizaproduccion_trazo
@idorden as int, @fecha as datetime as
update orden_produccion set orden_produccion.fecha_trazado_inicio=@fecha where id_orden=@idorden
GO

CREATE procedure actualiza_fechainicio
@idproduccionas int, @fecha as datetime as
update orden_produccion set fecha_inicio=@fecha where id_orden=@idproduccionas
GO

create procedure actualizaproduccion_trazo2
@idorden as int, @fecha as datetime as
update orden_produccion set orden_produccion.fecha_trazado_inicio=@fecha  where id_orden=@idorden
GO

CREATE procedure actualiza_rutasproduccion
@idproduccion as int, @rutas varchar(max), @fecha datetime as
update produccion set rutas=@rutas where idorden=@idproduccion
update orden_produccion set fecha_ruta=@fecha, ruta_establecida=1 where id_orden=@idproduccion
GO

CREATE procedure actualiza_observacionesproduccion
@idproduccion int, @observaciones varchar(max) as
update produccion set observaciones_diseño=@observaciones where idorden=@idproduccion
GO

CREATE procedure actualiza_estado_teladetalle
@iddetalle as int as
update produccion_detalle set tela_completa=1 where id_produccion_detalle=@iddetalle
GO	

create procedure actualizatrabajoseparadohojacorte
@orden int, @nombre varchar(max), @cantidadseparado int, @talla varchar(max), @color varchar(max) as
if exists(select * from trabajoseparadohojacorte where Orden=@orden and Nombre=@nombre and Cantidad=@cantidadseparado and Talla=@talla and Color=@color)
return 0
else
insert into trabajoseparadohojacorte(Orden, Nombre, Cantidad, Talla, Color) values (@orden, @nombre, @cantidadseparado, @talla, @color)
GO

create procedure actualiza_prendacorte
@idproduccion int, @fecha datetime as
if exists(select * from orden_produccion where tendido_completo=1 and fecha_tendido is not null and fecha_corte_inicio is not null and id_orden=@idproduccion)
update orden_produccion set corte=1, fecha_corte_terminado=@fecha, fecha_separado_inicio=@fecha where id_orden=@idproduccion
else
return 0
GO

create procedure actualiza_acorteproduccion
@idproduccion int, @fechatrazado datetime as
if exists(select * from orden_produccion where trazado_completo=1 and id_orden=@idproduccion)
return 0
else
update orden_produccion set trazado_completo=1, fecha_trazado_terminado=@fechatrazado where id_orden=@idproduccion
GO

create procedure actualiza_tendidoterminado
@idproduccion as int, @fechaterminado datetime as
if exists(select * from orden_produccion where tendido_completo=1 and id_orden=@idproduccion)
return 0
else
update orden_produccion set tendido_completo=1, fecha_tendido=@fechaterminado, fecha_corte_inicio=@fechaterminado where id_orden=@idproduccion
GO



Create procedure actualiza_produccionmaquilainterior
@idorden int as
update orden_produccion set en_maquila=1, fecha_maquila_salida=CURRENT_TIMESTAMP
update produccion_detalle set cantidad_prendas_final=0 where producionid=@idorden
GO		

---------------------------------------------------------------telas---------------------------------------------------------

create procedure eliminatelas
 @idtela int as
 delete from tela where id_tela=@idtela
 GO
		
CREATE procedure actualiza_telas_entrada
@idtela int, @cantidadprendas int as
update produccion_detalle set cantidad_prendas_final=@cantidadprendas where id_produccion_detalle=@idtela
GO
							
CREATE procedure actualiza_telascorte
@idtela int, @largotrazo float, @paños float, @utilizadotela float, @retazotela float, @saldotela float, @faltante float as
update tela set largo_trazo=@largotrazo, paños=@paños, utilizado_tela=@utilizadotela, retazo_tela=@retazotela, saldo_tela=@saldotela, faltante_tela=@faltante where id_tela=@idtela 
GO

CREATE procedure telas_produccioncorte
@produccion int as
select nombre_descripcion as 'Tela',
		metros,
		color,
		ancho,
		largo_trazo as 'Largo Trazo',
		paños,
		utilizado_tela as 'Tela Utilizada',
		retazo_tela as 'Retazo Tela',
		saldo_tela as 'Saldo',
		faltante_tela as 'Faltante',
		id_tela
from tela where produccion=@produccion
GO



CREATE procedure actualiza_orden_tela
@idorden as int, @fecha as datetime as
update orden_produccion set tela_completa=1, fecha_tela=@fecha where id_orden=@idorden
GO

CREATE procedure borra_tallacolorproduccion
@idproduccion as int, @talla as varchar(32), @color as varchar(32) as
delete from produccion_detalle where producionid=@idproduccion and talla=@talla and color=@color
GO


CREATE procedure modificatelacosteo
@nombre varchar(max), @precio float, @idtela int as
update telacosteo set nombre=@nombre, precio=@precio where idtelas=@idtela
GO

CREATE procedure eliminatelacosteo
@idtela int as 
delete from telacosteo where idtelas=@idtela
GO
		

-----------------------------------------------------------empleados-----------------------------------------------------------------------------------------------------------------------------------------------------------------------



create procedure DevuelveEmpleados
as
select Empleados.IDEmpleado, Empleados.Nombre from Empleados
GO
create procedure devuelveempleado
@idempleado int as
select * from Empleados where IDEmpleado=@idempleado
GO

create procedure ActualizaEmpleados
@idempleado int, @nombre varchar(max), @afinidad1 int, @afinidad2 int, @afinidad3 int as
Update Empleados set Nombre=@nombre, Afinidad1=@afinidad1, Afinidad2=@afinidad2, Afinidad3=@afinidad3 where IDEmpleado=@idempleado
GO

create procedure EliminaEmpleados
@idempleado int as
delete from Empleados where IDEmpleado=@idempleado
GO
create procedure eliminaempleadosproduccion 
@produccion int, @idempleado int as
delete from empleadosproduccion where Empleado=@idempleado and Produccion=@produccion
GO

create procedure devuelveempleadosproduccion
@idproduccion int as 
select empleadosproduccion.Empleado as 'ID',
Empleados.Nombre
from Empleados,
empleadosproduccion
where empleadosproduccion.Produccion=@idproduccion and Empleados.IDEmpleado=empleadosproduccion.Empleado
GO
							

create procedure actualizaempleadosporcentajesproduccion
@idporcentajeproduccion int, @fechaterminado datetime, @porcentajetrabajo decimal(18, 2)
as
update EmpleadosPorcentajesProduccion set FechaTerminado=@fechaterminado, PorcentajeTrabajo=@porcentajetrabajo where IDPorcentajeProduccion=@idporcentajeproduccion
GO

create procedure devuelveempleadosmaquilapoduccion
@idproduccion int as
select Empleados.Nombre as 'Empleado',
procesos.operacion as 'Trabajo',
EmpleadosPorcentajesProduccion.FechaAsignado,
EmpleadosPorcentajesProduccion.FechaTerminado,
EmpleadosPorcentajesProduccion.Cantidad,
EmpleadosPorcentajesProduccion.TiempoEsperado,
EmpleadosPorcentajesProduccion.PorcentajeTrabajo,
EmpleadosPorcentajesProduccion.IDPorcentajeProduccion as 'Folio Trabajo'
from
Empleados,
procesos,
EmpleadosPorcentajesProduccion
where EmpleadosPorcentajesProduccion.Produccion=@idproduccion and EmpleadosPorcentajesProduccion.Proceso=procesos.id_procesos and EmpleadosPorcentajesProduccion.Empleado=Empleados.IDEmpleado
GO 




----------------------------------------------procesos trabajo---------------------------------------------------------------------------------------------------------------------------------------------------------------------

create procedure eliminaprocesostrabajo
@idtrabajoprocesos int as
delete from trabajoprocesos where IDTrabajoprocesos=@idtrabajoprocesos
GO

create procedure actualizaprocesostrabajo
@idtrabajoproceso int, @idproduccion int, @cantidad decimal(18, 2), @tiempototal decimal(18, 2) as
update trabajoprocesos set Cantidad=@cantidad, TiempoTotal=@tiempototal where IDTrabajoprocesos=@idtrabajoproceso
Go

create procedure produccionprocesostrabajo
@idproduccion int as
select trabajoprocesos.IDTrabajoprocesos as 'ID',
procesos.operacion as 'Operacion',
trabajoprocesos.Cantidad,
trabajoprocesos.TiempoTotal,
procesos.id_procesos as 'IDProceso'
from procesos,
trabajoprocesos
where procesos.id_procesos=trabajoprocesos.Proceso and trabajoprocesos.Produccion=@idproduccion
GO	

-----------------------------------------pellones-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


create procedure actualizapellones 
@idorden int, @pellones varchar(max), @modelo varchar(max), @Composicion varchar(max), @Marca varchar(max) as
update Pellones set Pellon=@pellones, Modelo=@modelo, Composicion=@Composicion, Marca=@Marca where Orden=@idorden
GO

create procedure devuelvepellones
@idorden int as 
select * from Pellones where Pellones.Orden=@idorden
GO
--------------------------------------------plantillas--------------------------------------------------------------------------------------------------------------------------------------------------

create procedure eliminaplantilla
@idplantilla int as
delete from aviosplantilla where IDplantilla=@idplantilla
delete from piezasplantilla where IDplantilla=@idplantilla
delete from procesosplantilla where IDplantilla=@idplantilla
delete from acabadosplantilla where IDplantilla=@idplantilla
delete from plantillasespecificaciones where plantillaid=@idplantilla
delete from plantillas where IDPlantilla=@idplantilla
GO

create procedure actualizaespecificacionesdeplantilla
@idficha int, @observaciones varchar(max), @especificaciones varchar(max) as
exec insertaespecificacionesfichatecnica @idficha, @especificaciones
update ficha_tecnica set ficha_tecnica.especificacionescostura=@observaciones where ficha_tecnica.idficha_tecnica=@idficha
GO
create procedure InsertaEspecificacionesplantillas
@idplantilla int, @observaciones varchar(max), @especificaciones varchar(max) as
if exists(select * from plantillasespecificaciones where plantillaid=@idplantilla)
update plantillasespecificaciones set Observaciones=@observaciones, Especificaciones=@especificaciones where plantillaid=@idplantilla
else
insert into plantillasespecificaciones values(@idplantilla, @observaciones, @especificaciones)
GO

create procedure devuelveespecificacionesplantilla
@idplantilla int as
select plantillasespecificaciones.Observaciones, plantillasespecificaciones.Especificaciones from plantillasespecificaciones where plantillaid=@idplantilla
GO



create procedure devuelvepiezasplantilla
@idplantilla int as
select piezasplantilla.id_pieza as 'ID',
piezas.nombre as 'Nombre',
piezasplantilla.cantidad as 'Cantidad'
from piezas,
piezasplantilla
where piezasplantilla.IDplantilla=@idplantilla and piezas.id_piezas=piezasplantilla.id_pieza
GO

CREATE procedure insertaplantilla_piezas
@idplantilla as int, @idpieza as int, @cantidad as float as
if EXISTS(select * from piezasplantilla where IDplantilla=@idplantilla and id_pieza=@idpieza)
UPDATE piezasplantilla SET cantidad=@cantidad where IDplantilla=@idplantilla and id_pieza=@idpieza
ELSE
insert into piezasplantilla values(@idplantilla, @idpieza, @cantidad);
GO

create procedure eliminapiezas_plantilla
@idplantilla int, @idpieza int as
delete from piezasplantilla where IDplantilla=@idplantilla and id_pieza=@idpieza
GO
		
create procedure devuelveprocesosplantilla
@idplantilla int as
select procesosplantilla.id_proceso as 'ID',
procesos.operacion as 'Operacion',
procesos.tiempo as 'Tiempo'
from procesos,
procesosplantilla
where procesosplantilla.IDplantilla=@idplantilla and procesos.id_procesos=procesosplantilla.id_proceso
GO

CREATE procedure insertaplantilla_procesos
@idplantilla as int, @idproceso as int as
if EXISTS(select * from procesosplantilla where IDplantilla=@idplantilla and id_proceso=@idproceso)
return 0
ELSE
insert into procesosplantilla values(@idplantilla, @idproceso);
GO

create procedure eliminaplantilla_procesos
@idplantilla int, @idproceso int as
delete from procesosplantilla where IDplantilla=@idplantilla and id_proceso=@idproceso
GO

create procedure devuelveacabados_plantilla
@idplantilla int as
select acabadosplantilla.id_acabdos as 'ID',
acabados.operacion as 'Nombre',
acabadosplantilla.cantidad as 'Cantidad',
acabadosplantilla.tiempo_total as 'Tiempo'
from acabados,
acabadosplantilla
where acabadosplantilla.IDplantilla=@idplantilla and acabados.id_acabados=acabadosplantilla.id_acabdos
GO
							
create procedure insertaplantilla_acabados
@idplantilla as int, @idacabado as int, @cantidad as float, @tiempo as decimal(18, 2) as
if EXISTS(select * from acabadosplantilla where IDplantilla=@idplantilla and id_acabdos=@idacabado)
UPDATE acabadosplantilla SET cantidad=@cantidad, tiempo_total=@tiempo where IDplantilla=@idplantilla and id_acabdos=@idacabado
ELSE
insert into acabadosplantilla values(@idplantilla, @idacabado, @cantidad, @tiempo);
GO

create procedure eliminaacabados_plantilla
@idplantilla int, @idacabados int as
delete from acabadosplantilla where IDplantilla=@idplantilla and id_acabdos=@idacabados
GO


CREATE procedure numeroplantilla
as
select MAX(IDPlantilla) from plantillas;
GO						
						
create procedure modificaplantillas
@idplantilla int, @Nombre varchar(max) as
update plantillas set Nombre=@Nombre where IDPlantilla=@idplantilla
GO
