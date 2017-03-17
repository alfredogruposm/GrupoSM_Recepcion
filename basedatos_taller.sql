Delete database 
create table BitacoraRespaldos(IDRespaldo int not null identity(100, 1) primary key,
								Fecha datetime);

create table trabajoseparadohojacorte(IDTrabajoseparado int not null identity(100, 1) primary key,
									Orden int not null foreign key references orden_produccion(id_orden),
									Nombre varchar(max),
									Cantidad int,
									Talla varchar(max),
									Color varchar(max));
									GO

create table Empleados(IDEmpleado int not null identity(100, 1) primary key,
						Nombre varchar(max),
						Afinidad1 int,
						Afinidad2 int,
						Afinidad3 int)
						GO
						

										
		
CREATE table procesos(id_procesos int not null identity(100,1) primary key,						
							operacion varchar(max),
							tipo int not null,
							tiempo float);
							
			
CREATE table acabados(id_acabados int not null identity(100,1) primary key,						
							operacion varchar(max),
							tipo int not null,
							tiempo float);
			
	


CREATE table clientes(idclientes int not null identity(100,1) primary key, nombre varchar(max),
						 costo_minuto float, costo_metro float);
GO


CREATE table proveedor(idproveedor int not null identity(100,1) primary key, nombre varchar(max));
GO
				

CREATE table maquiladores(idmaquiladores int not null identity(100,1) primary key,
							nombre varchar(max),
							precio_minuto float);
GO
CREATE table solicitud(id_solicitud int not null identity(100,1) primary key,
						 id_cliente int not null foreign key references clientes(idclientes),
						 asunto varchar(max),
						 fecha datetime,
						 respondido int,
						 descripcion varchar(max));
GO						 
CREATE table solicitudrespuesta(id_solicitudrespuesta int not null identity(100,1) primary key,
								solicitud int not null foreign key references solicitud(id_solicitud),
								fecharespuesta datetime);
GO								



CREATE table ficha_detalle(idficha_detalle int not null identity(100,1) primary key,
							nombre_prenda varchar(max),
							modelo varchar(max),
							tela varchar(max),
							ancho_tela float,
							consumo_tela float,
							combinacion varchar(max),
							ancho_tela_conbinacion float,
							consumo_conbinacion float,
							forro varchar(max),
							ancho_tela_forro float,
							consumo_forro float);
GO							
											
CREATE table ficha_tecnica(idficha_tecnica int not null identity(100,1) primary key,
							idficha_detalle int not null foreign key references ficha_detalle(idficha_detalle),
							idsolicitud int foreign key references solicitud(id_solicitud),
							cliente int foreign key references clientes(idclientes),
							especificacionescostura varchar(max),
							tiempo_costura float,
							tiempo_acabados float,
							Costeo float);
GO

create table plantillas(IDPlantilla int not null identity(100,1) primary key,
						Nombre varchar(max))
						GO


CREATE table avios(id_avios int not null identity(100,1) primary key,						
							nombre varchar(max),
							tipo int not null,
							precio float);
							
							
							
CREATE table avios_bodega(idaviosbodega int not null identity(100,1) primary key,
							idavios int not null foreign key references avios(id_avios),
							cantidad float);

CREATE table avios_detalle(id_avios_detalle int not null identity(100,1) primary key,							
							id_ficha int not null foreign key references ficha_tecnica(idficha_tecnica),
							id_avio int not null foreign key references avios(id_avios),
							cantidad float not null,
							costo float not null);
							
						
						

CREATE table piezas(id_piezas int not null identity(100,1) primary key,						
							tipo int not null,
							nombre varchar(max));
						
CREATE table piezas_detalle(id_piezas_detalle int not null identity(100,1) primary key,							
							id_ficha int not null foreign key references ficha_tecnica(idficha_tecnica),
							id_pieza int not null foreign key references piezas(id_piezas),
							cantidad float not null);
						
				
						
CREATE table procesos_detalle(id_procesos_detalle int not null identity(100,1) primary key,							
							id_ficha int not null foreign key references ficha_tecnica(idficha_tecnica),
							id_proceso int not null foreign key references procesos(id_procesos));
							
									

						
CREATE table acabados_detalle(id_acabados_detalle int not null identity(100,1) primary key,							
							id_ficha int not null foreign key references ficha_tecnica(idficha_tecnica),
							id_acabdos int not null foreign key references acabados(id_acabados),
							cantidad float not null,
							tiempo_total float not null);
							GO
							
CREATE table orden_produccion(id_orden int not null identity(100,1) primary key,
							id_cliente int not null foreign key references clientes(idclientes),
							asunto varchar(max),
							observaciones varchar(max),
							fecha_inicio datetime,
							fecha_entrega datetime,
							avios_completo int,
							fecha_avios datetime,
							tela_completa int,
							fecha_tela datetime,
							ruta_establecida int,
							fecha_ruta datetime,
							trazado_completo int,
							fecha_trazado_inicio datetime,
							fecha_trazado_terminado datetime,
							tendido_completo int,
							fecha_tendido datetime,
							corte int,
							fecha_corte_inicio datetime,
							fecha_corte_terminado datetime, 
							separado int,
							fecha_separado_inicio datetime,
							fecha_separado_terminado datetime,
							en_maquila int,
							fecha_maquila_salida datetime,
							fecha_maquila_entrada datetime,
							acabados int,
							fecha_acabados_inicio datetime,
							fecha_acabados_terminado datetime,
							calidad int,
							Terminado int);
							GO
	

	
Create table empleadosproduccion(IDEmpleadoProduccion int not null identity(100, 1) primary key,
											Empleado int not null foreign key references Empleados(IDEmpleado),
											Produccion int not null foreign key references orden_produccion(id_orden))
											GO
CREATE table produccion(id_produccion int not null identity(100,1) primary key,
							idorden int not null foreign key references orden_produccion(id_orden),
							idficha int not null foreign key references ficha_tecnica(idficha_tecnica),
							observaciones_diseño varchar(max),
							rutas varchar(max),
							trazo varchar(max),
							tendio varchar(max),
							corto varchar(max),
							separado varchar(max),
							marca varchar(max),
							pellon varchar(max));
							
												
CREATE table avios_produccion(idavios_produccion int not null identity(100,1) primary key,
							aviosid int not null foreign key references avios(id_avios),
							producciondetalle int not null foreign key references produccion(id_produccion),
							cantidad_necesaria float not null);
							
						
CREATE table produccion_detalle(id_produccion_detalle int not null identity(100,1) primary key,
							producionid int not null foreign key references produccion(id_produccion),
							tela varchar(max),
							combinacion varchar(max),
							num_tela_rollo float,
							num_combinacion_rollo float,
							talla float not null,
							color varchar(max),
							metros_recibidos float,
							cantidad_prendas float,
							avios_completo int,
							tela_completa int,
							maquila_completa int,
							metros_hilo float,
							cantidad_prendas_final float);
							
CREATE table tela(id_tela int not null identity(100,1) primary key,
							proveedor int not null foreign key references proveedor(idproveedor),
							produccion int not null foreign key references orden_produccion(id_orden),
							fecha_entrada datetime,
							nombre_descripcion varchar(max),
							metros decimal(18, 2),
							composicion varchar(max),
							color varchar(max),
							ancho decimal (18,2),
							largo_trazo decimal (18,2),
							paños decimal (18,2),
							utilizado_tela decimal (18,2),
							retazo_tela decimal (18,2),
							saldo_tela decimal (18,2),
							faltante_tela decimal (18,2),
							precio_metro decimal (18,2),
							tipo int);

alter procedure devuelvetelas
@proveedor int, @produccion int, @fechaentrada datetime, @nombre varchar(max), @metros decimal (18,2), 
@composicion varchar(max), @color varchar(max), @ancho decimal (18,2), @largotrazo decimal (18,2), @paños decimal (18,2),
@utilizadotela decimal (18,2), @retazotela decimal (18,2), @saldotela decimal (18,2), @faltantetela decimal (18,2),
@preciometro decimal (18,2), @tipo int as
insert into tela (proveedor, produccion, fecha_entrada, nombre_descripcion, metros, composicion, color,
ancho, largo_trazo, paños, utilizado_tela, retazo_tela, 
saldo_tela, faltante_tela, precio_metro, tipo) values (@proveedor, @produccion, @fechaentrada, @nombre,
@metros, @composicion, @color, @ancho, @largotrazo, @paños, @utilizadotela, @retazotela, @saldotela, @faltantetela,
@preciometro, @tipo)
							
												
CREATE table telarequisicion(idtela int not null identity(100,1) primary key,
							Orden int not null foreign key references orden_produccion(id_orden),
							Cantidad Decimal(18, 2),
							Tipo varchar(max),
							Nombre varchar(max),
							Color varchar(max));
						
									
							
CREATE table telacosteo(idtelas int not null identity(100,1) primary key,
						nombre varchar(max), 
						precio float);
                           
							
							
CREATE table salida_maquila(id_salida int not null identity(100,1) primary key,							
							id_producciondetalle int not null foreign key references orden_produccion(id_orden),
							maquilador int not null foreign key references maquiladores(idmaquiladores),
							prendas_enviadas float,
							prendas_recibidas float,
							mano_obra float);
							GO
			
-----------------------------------------------------------------------------------------------------------------------						

create table salidamaquiladetalle(id_salidadetalle int not null identity(100,1) primary key,
									idproduccion int not null foreign key references orden_produccion(id_orden),
									Fecha datetime,
									Modelo varchar(max),
									Mano_de_obra decimal(18, 2),
									Prenda varchar(max),
									Tela varchar(max),
									Notas varchar(max),
									Especificaciones varchar(max),
									Pagare varchar(max),
									Maquilador varchar(max));
									GO

							

			
create table salidadetalleavios(id_salidaavios int not null identity(100,1) primary key,
								idproduccion int not null foreign key references orden_produccion(id_orden),
								texto1 varchar(max),
								texto2 varchar(max))
								GO
				
		
								


create table trabajoprocesos(IDTrabajoprocesos int not null identity(100, 1) primary key,
								Produccion int not null foreign key references orden_produccion(id_orden),
								Proceso int not null foreign key references procesos(id_procesos),
								Cantidad decimal(18, 2),
								TiempoTotal decimal(18, 2));
GO								


Create table EmpleadosPorcentajesProduccion(IDPorcentajeProduccion int not null identity(100, 1) primary key,
											Empleado int not null foreign key references Empleados(IDEmpleado),
											Produccion int not null foreign key references orden_produccion(id_orden),
											Proceso int not null foreign key references procesos(id_procesos),
											FechaAsignado datetime,
											FechaTerminado datetime,
											Cantidad decimal(18, 2),
											TiempoEsperado decimal(18, 2),
											PorcentajeTrabajo decimal(18, 2));
											GO
	














create table especificacionesficha(idespecificaciones int not null identity(100,1) primary key,
									fichatecnica int not null foreign key references ficha_tecnica(idficha_tecnica),
									Especificaciones varchar(max))
									GO


	
create table Pellones(IDPellones int not null identity(100,1) primary key,
						Orden int not null foreign key references orden_produccion(id_orden),
						Pellon varchar(max),
						Modelo varchar(max));
						GO

									
						
Create table AviosSubgrupos(IDAviosSubGrupo int not null identity(100, 1) primary key,
							IDAvioPrincipal int not null foreign key references avios(id_avios),
							IDAvioSubColor int not null foreign key references avios(id_avios))
							GO

create table ColorAvio(IDColoravios int not null identity(100, 1) primary key,
						IDAviopro int not null foreign key references avios_produccion(idavios_produccion) ON DELETE CASCADE,
						Color varchar(max),
						Talla varchar(max))
						GO
						

	
create table plantillasespecificaciones(idespecificacionesplantilla int not null identity(100,1) primary key,
									plantillaid int not null foreign key references plantillas(IDPlantilla),
									Observaciones varchar(max),
									Especificaciones varchar(max))
									GO			
							
create table aviosplantilla(IDaviosplantilla int not null identity(100,1) primary key,							
							IDplantilla int not null foreign key references plantillas(IDPlantilla),
							id_avio int not null foreign key references avios(id_avios),
							cantidad decimal(18, 2),
							costo decimal(18, 2));
GO

			
CREATE table piezasplantilla(IDpiezasplantilla int not null identity(100,1) primary key,							
							IDplantilla int not null foreign key references plantillas(IDPlantilla),
							id_pieza int not null foreign key references piezas(id_piezas),
							cantidad float not null);						
GO
CREATE table procesosplantilla(idprocesosplantilla int not null identity(100,1) primary key,							
							IDplantilla int not null foreign key references plantillas(IDPlantilla),
							id_proceso int not null foreign key references procesos(id_procesos));
GO

CREATE table acabadosplantilla(id_acabados_detalle int not null identity(100,1) primary key,							
							IDplantilla int not null foreign key references plantillas(IDPlantilla),
							id_acabdos int not null foreign key references acabados(id_acabados),
							cantidad float not null,
							tiempo_total float not null);
							GO

Create table Costeo(IDCosteo int not null identity(100,1) primary key,
					IDFichaTecnica int not null foreign key references ficha_tecnica(idficha_tecnica),
					Fecha datetime,
					CobroMinuto decimal(18, 2),
					CostoAvios decimal (18, 2),
					CostoMetros decimal (18, 2),
					CostoVenta decimal (18, 2),
					CostoMaquila decimal (18, 2),
					Comision decimal (18, 2),
					PrecioMaquila decimal (18, 2),
					PrecioVenta decimal (18, 2),
					TiempoAcabados decimal (18, 2),
					TiempoCostura decimal (18, 2))
					GO

create table TelaCosteo_Detalle(IDTelaCosteoDetalle int not null identity(100,1) primary key,
								IDTelaCosteo int not null foreign key references TelaCosteo(idtelas),
								IDCosteo int not null foreign key references Costeo(IDCosteo),
								Tipo varchar(max),
								Ancho decimal(18, 2))
								GO

create table AviosAlmacen(IDAvio int not null identity(100,1) primary key,
							IDAvioAlmacen int not null foreign key references AviosAlmacen_Detalle(IDAvioAlmacen_detalle),
							Nombre varchar(max),
							Tipo varchar(max))
							GO

create table AviosAlmacen_Detalle(IDAvioAlmacen_Detalle int not null identity(100,1) primary key,
									IDProduccion int not null foreign key references orden_produccion(id_orden),
									Cantidad decimal(18, 2))
									GO
										


							
		
-----------------------------------------------------------nuevas por implementar taller----------------------------------------------

						

	
							
------------------------------------------------------------sin ordenar--------------------------------------------------

update orden_produccion set avios_completo=null, fecha_avios=null where id_orden=12

delete from ColorAvio
delete from AviosSubgrupos
delete from aviosplantilla
delete from avios_produccion

delete from AviosAlmacen
delete from AviosAlmacen_Detalle
--delete from avios_detalle
--delete from avios_bodega
--delete from avios


alter table Pellones add Modelo varchar(max);	
go

alter table Pellones add Composicion varchar(max);	
go

alter table Pellones add Marca varchar(max);	
go	
		


----alter procedure vertelasproduccion
----@idproduccion as int as	
----SELECT color, CAST(SUM(metros_recibidos) as decimal(32, 2)) as Metros, SUM(cantidad_prendas) as Cantidad_prendas
----FROM produccion_detalle
----WHERE producionid=@idproduccion
----GROUP BY color

alter table produccion_detalle add metros_recibidosforro decimal(18, 2);

--ALTER TABLE salida_maquila
--DROP CONSTRAINT FK__salida_ma__id_pr__7AF13DF7;

--ALTER TABLE salida_maquila
--ADD CONSTRAINT FK__salida_ma__id_pr__7AF13DF7
--FOREIGN KEY (id_producciondetalle)
--REFERENCES orden_produccion(id_orden)

--		--select * from avios
----select * from avios_bodega
----select * from avios_detalle
----select * from avios_produccion

  delete from trabajoseparadohojacorte
  delete from trabajoprocesos
  delete from tela
  delete from salidamaquiladetalle
  delete from salidadetalleavios
  delete from salida_maquila
  delete from produccion_detalle
  delete from produccion
  delete from Pellones
  delete from avios_produccion
  delete from ColorAvio
  delete from orden_produccion

  update orden_produccion set trazado_completo=null
		,fecha_trazado_inicio=null
      ,fecha_trazado_terminado=null
      ,tendido_completo=null
      ,fecha_tendido=null
      ,corte=null
      ,fecha_corte_inicio=null
      ,fecha_corte_terminado=null
      ,separado=null
      ,fecha_separado_inicio=null
      ,fecha_separado_terminado=null
      ,en_maquila=null
      ,fecha_maquila_salida=null
      ,fecha_maquila_entrada=null
      ,acabados=null
      ,fecha_acabados_inicio=null
      ,fecha_acabados_terminado=null
      ,calidad=null
      ,Terminado=null
 where id_orden=2

 update orden_produccion set ruta_establecida=null, fecha_ruta=null, trazado_completo=null, fecha_trazado_inicio=null, tendido_completo=null, fecha_tendido=null, fecha_corte_inicio=null, fecha_trazado_terminado=null, corte=null, fecha_corte_terminado=null, fecha_separado_inicio=null, fecha_separado_terminado=null, separado=null 
 where id_orden=103
  GO
----select * from ordenesvista
delete from AviosAlmacen
delete from AviosAlmacen_Detalle
	DBCC CHECKIDENT ('AviosAlmacen', RESEED, 1); 
	DBCC CHECKIDENT ('AviosAlmacen', RESEED); 		
	DBCC CHECKIDENT ('AviosAlmacen_Detalle', RESEED, 1); 
	DBCC CHECKIDENT ('AviosAlmacen_Detalle', RESEED); 
	DBCC CHECKIDENT ('produccion_detalle', RESEED, 22); 
	DBCC CHECKIDENT ('produccion_detalle', RESEED); 
													
----CREATE UNIQUE INDEX ui_Vfichas_tecnicas ON dbo.Vfichas_tecnicas(idficha_tecnica);
----SELECT Name
----FROM Production.Product
----WHERE CONTAINS(Name, '"chain*" OR "full*"');

----CREATE procedure filtro_modelofichastecnicas
----@modelo varchar(max) as
----select * from Vfichas_tecnicas where contains(modelo, '@modelo OR @modelo*');

--						--	update orden_produccion set fecha_separado_inicio=CURRENT_TIMESTAMP
--							--select * from orden_produccion
--							--select * from produccion;
							
							
DBCC CHECKIDENT ('Person.AddressType', RESEED, 10); 							
						
--							--CREATE view telas_bodega 
--							--as
--							--select clientes.nombre,
--							--		nombre_descripcion as 'Tela',
--							--		metros, 
--							--		composicion,
--							--		color,
--							--		ancho,
--							--		tipo,
--							--		idtela,
							
						