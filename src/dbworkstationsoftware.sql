-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-05-2015 a las 20:13:26
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
Create Database dbworkstationsoftware;
use dbworkstationsoftware;
--
-- Base de datos: `dbworkstationsoftware`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarArticulo`(
    in idArticu				int,
	in idCategoriaArticu	int,
	in descripcionArticu	varchar(50),
	in cantidadDisponib		int,
	in precioUnitar			int
)
BEGIN
	update tblArticulo set idCategoriaArticulo=idCategoriaArticu,descripcionArticulo=descripcionArticu,cantidadDisponible=cantidadDisponib,precioUnitario=precioUnitar
		where idArticulo=idArticu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCategoriaArticulo`(
    in idCategoriaArticu			int,
	in nombreCategoriaArticu	varchar(50)
)
BEGIN
	update tblCategoriaArticulo set nombreCategoriaArticulo=nombreCategoriaArticu where idCategoriaArticulo=idCategoriaArticu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCategoriaCurso`(idCategoria int, nombreCategoria varchar(30))
BEGIN
	update tblcategoriacurso set nombreCategoriaCurso=nombreCategoria
	where idtblCategoriaCurso=idCategoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCompra`(IN `numeroFactura` VARCHAR(50), IN `nombreProveedor` VARCHAR(50), IN `fechaCompra` DATE, IN `totalCompra` INT)
    NO SQL
BEGIN
	declare msg varchar(40);   
	update tblCompra set numeroFactura=numeroFactu,nombreProveedor=nombreProveed,fechaCompra=fechaComp,totalCompra=totalComp
		where numeroFactura=numeroFactu;
	set msg="Compra actualizada exitosamente";	
    select msg as Respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCredito`(
    in idCredi		int,
    in idSaldoActu	int,
    in estadoCredi	int
)
BEGIN
	update tblCredito set idSaldoActual=idSaldoActu,estadoCredito=estadoCredi
		where idCredito=idCredi;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCurso`(
    in idCur			int,
	in nombreCur		varchar(50),
	in duracionCur		int,
	in estadoCur		int,
	in descripcionCur	varchar(100),
in categoriaCur tinyint
)
BEGIN
	update tblCurso set nombreCurso=nombreCur,duracionCurso=duracionCur, `descripcionCurso`=descripcionCur, estadoCurso=estadoCur, `tblcategoriacurso_idtblCategoriaCurso`=categoriaCur where idCurso=idCur;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEmpresa`(
    in nitEmpre				int,
	in nombreEmpre			varchar(50),
	in direccionEmpre		varchar(50),
	in nombreContac			varchar(50),
	in telefonoContac		varchar(50),
	in emailContac			varchar(50)
)
BEGIN
	declare msg varchar(40);    
	update tblEmpresa set nombreEmpresa=nombreEmpre,direccionEmpresa=direccionEmpre,nombreContacto=nombreContac,telefonoContacto=telefonoContac,emailContacto=emailContac
	 where nitEmpresa=nitEmpre;
	set msg="Datos de la empresa actualizados correctamente";
	select msg as Respuesta; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstadoCurso`(
    in idCur			int,
    in estadoCur		int
)
BEGIN
	update tblCurso set estadoCurso=estadoCur where idCurso=idCur;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstadoFicha`(
    in idFich			int,
    in estadoFich		int
)
BEGIN
	update tblficha set estado = estadoFich where `idFicha`=idFich;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstadoSeminario`(
    in idSem			int,
    in estado   		int
)
BEGIN
	update tblseminario set `estadoSeminario` = estado where `idSeminario`=idSem;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstudiante`(IN `tipoDocumen` VARCHAR(5),
 IN `numeroDocumen` VARCHAR(20),
 IN `fechaNacimien` DATE,
 IN `generoClien` INT,
 IN `nombreClien` VARCHAR(50),
 IN `apellidoClien` VARCHAR(50),
 IN `direccionClien` VARCHAR(50),
 IN `telefonoFi` VARCHAR(15),
 IN `telefonoMov` VARCHAR(15),
 IN `emailClien` VARCHAR(50),
 IN `estado` INT,
 IN `tipoDocAcudien` varchar(5),
 IN `numDocAcudien` varchar (15)
)
BEGIN
    UPDATE tblestudiante 
    SET `fechaNacimiento` = `fechaNacimien`,
        `generoCliente` = `generoClien`,
        `nombreCliente` = `nombreClien`,
        `apellidoCliente` = `apellidoClien`,
        `direccionCliente` = `direccionClien`,
        `telefonoFijo` =  `telefonoFi`,
        `telefonoMovil` = `telefonoMov`,
        `emailCliente` = `emailClien`,
        `estadoEstudiante` = `estado`,
        `tblacudiente_tipoDocumento` = `tipoDocAcudien`,
        `tblacudiente_numeroDocumento` = `numDocAcudien`
    WHERE `tipoDocumento`=`tipoDocumen` AND `numeroDocumento`=`numeroDocumen`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarFicha`(
    in idFic			int,
	in idCurs			int,
	in cuposDisponibl	int,
	in fechaInic		date, 
in precio int,
in estadoFich int
)
BEGIN
	update tblFicha set `tblcurso_idCurso`=idCurs,cuposDisponibles=cuposDisponibl,fechaInicio=fechaInic, `precioFicha`=precio, estado= estadoFich where idFicha=idFic;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarMatricula`(
    in idMatricu			int,
	in estadoMatricu		int,
	in fechaInic			date
)
BEGIN
	update tblCategoriaArticulo set nombreCategoriaArticulo=nombreCategoriaArticu where idCategoriaArticulo=idCategoriaArticu;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarSeminario`(
    in idSeminar			int,
	in nombreSeminar		varchar(50),
	in duracionSeminar		int,
	in estadoSeminar		int
)
BEGIN
	update tblSeminario set nombreSeminario=nombreSeminar,duracionSeminario=duracionSeminar,estadoSeminario=estadoSeminar
	 where idSeminario=idSeminar;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarAbonoByCredito`(IN `idCredi`     int)
select (a.idAbono, a.idCredito, a.valorAbono, a.fechaPago) from tblAbono a inner join tblCredito c on(a.idCredito=c.idCredito) 
where a.idCredito like concat('%',idCredi,'%') 
order by (a.idCredito,a.FechaPago)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarArticuloByNombre`(IN `nombre` VARCHAR(50))
    NO SQL
select idArticulo, descripcionArticulo, precioUnitario, cantidadDisponible, nombreCategoriaArticulo from tblArticulo a inner join tblCategoriaArticulo ca on(a.idCategoriaArticulo=ca.idCategoriaArticulo) where descripcionArticulo like concat('%',nombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarClientesCurso`(

)
BEGIN
	select tblCliente.idCliente, tblCliente.nombreCliente, tblCliente.apellidoCliente, tblCurso.nombreCurso 
	from (((tblCliente inner join tblVenta on tblVenta.idCliente = tblCliente.idCliente) inner join tblMatricula on tblMatricula.idVenta=tblVenta.idVenta) inner join tblFicha on tblFicha.idMatricula=tblMatricula.idMatricula) inner join tblCurso on tblCurso.idCurso=tblFicha.idCurso
	group by tblCurso.idCurso
	order by tblCliente.apellidoCliente;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarComprasRangoFecha`(
	in	fechaInici	datetime,
	in	fechaFin	datetime
)
BEGIN
	select * from tblCompra
	where fechaCompra BETWEEN fechaInici AND fechaFin;
	
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCursoPorID`(id int)
BEGIN
SELECT idCurso,
    nombreCurso,
    duracionCurso,
    estadoCurso,
    descripcionCurso,
idtblCategoriaCurso,
    nombreCategoriaCurso
FROM tblcurso c inner join tblcategoriacurso cc on(c.`tblcategoriacurso_idtblCategoriaCurso`=cc.`idtblCategoriaCurso`) where idCurso =id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCursos`()
BEGIN

SELECT idCurso,
    nombreCurso,
    duracionCurso,
    estadoCurso,
    descripcionCurso,
    nombreCategoriaCurso
FROM tblcurso c inner join tblcategoriacurso cc on(c.`tblcategoriacurso_idtblCategoriaCurso`=cc.`idtblCategoriaCurso`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarDetallesCompra`(
	in idComp	int
)
BEGIN
	select * from tblDetalleCompra
	where idCompra = idComp
	order by idArticulo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEmpresabyNIT`(IN `nitEmpre` VARCHAR(20))
select * from tblEmpresa where nitEmpresa like concat('%',nitEmpre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEstudianteCreditosActivos`(
 )
BEGIN
	
	select tblestudiante.nombreCliente, tblestudiante.apellidoCliente, tblestudiante.telefonoFijo, tblestudiante.telefonomovil, tblestudiante.emailCliente, tblestudiante.saldoActual 
	from tblestudiante inner join tblCredito on tblestudiante.`tipoDocumento` = tblCredito.`tipoDocumento` AND tblestudiante.`numeroDocumento` = tblCredito.`numeroDocumento`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEstudiantePorID`(id int, tipo varchar(5))
BEGIN
SELECT 
    `tipoDocumento`,
    `numeroDocumento`,
    `fechaNacimiento`,
    `generoCliente`,
    `nombreCliente`,
    `apellidoCliente`,
    `direccionCliente`,
    `telefonoFijo`,
    `telefonoMovil`,
    `emailCliente`, 
    `estadoEstudiante`,
    `tblacudiente_tipoDocumento`, 
    `tblacudiente_numeroDocumento`
FROM tblestudiante WHERE `tipoDocumento` = tipo AND `numeroDocumento`= id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEstudiantes`()
BEGIN
SELECT 
    `tipoDocumento`,
    `numeroDocumento`,
    `fechaNacimiento`,
    `generoCliente`,
    `nombreCliente`,
    `apellidoCliente`,
    `direccionCliente`,
    `telefonoFijo`,
    `telefonoMovil`,
    `emailCliente`, 
    `estadoEstudiante`,
    `tblacudiente_tipoDocumento`, 
    `tblacudiente_numeroDocumento`
FROM tblestudiante;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarFichaPorID`(id int)
BEGIN
SELECT `idFicha`,
    `cuposDisponibles`,
    DATE_FORMAT(`fechaInicio`, '%d/%m/%yy'),
    `tblcurso_idCurso`,
    `precioFicha`,
estado
FROM `tblficha` where idFicha = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarFichas`()
BEGIN
SELECT `idFicha`,
    `cuposDisponibles`,
    `fechaInicio`,
    `precioFicha`,
    nombreCurso,
    estado,
    `idCurso`
FROM `tblficha` f inner join tblCurso c on(f.tblCurso_idCurso=c.idCurso);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarInscritosSeminario`(
    in idSeminar       int
 )
BEGIN
	declare msg varchar(40);    
	select count(*) as Inscritos from tblInscripcion where idSeminario = idSeminar;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarSeminarioPorID`(id int)
BEGIN
SELECT 
         `idSeminario`
        ,`nombreSeminario`
        ,`duracionSeminario`
        ,`estadoSeminario`
FROM tblseminario where `idSeminario` = id; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarSeminarios`()
BEGIN
SELECT 
          `idSeminario`
        , `nombreSeminario`
        , `duracionSeminario`
        , `estadoSeminario` 
FROM tblseminario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarSubsidiosEmpresa`(

	in idEmpre	int

)
BEGIN
	select * from tblSubsidio
	where idEmpresa = idEmpre
	order by idSubsidio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarUsuarioModulo`(IN `idUser` INT)
    COMMENT 'Hecho el 28/02/2015 - Juan Montoya'
begin
select tblusuario.idusuario "id", tblmodulo.enlace "enlace", tblmodulo.nombre "nombre" from tblusuario inner join tblrol on (tblusuario.idrol = tblrol.idrol) inner join tblmodulorol on(tblrol.idrol=tblmodulorol.idrol) inner join tblmodulo on(tblmodulorol.idmodulo=tblmodulo.idmodulo) where tblusuario.idusuario=idUser;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarVentasDiarias`(

)
BEGIN
	select * from tblVenta
	where fechaVenta = CURDATE();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarAbono`(
    in idAbo        int,
    in valorAbo     int,
    in fechaPa    datetime,
    in idCredi      int
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select idAbono from tblAbono where idAbono=idAbo)) then
		set msg="Este abono ya fue registrado.";
		select msg as Respuesta;
	else
		insert into tblAbono (idCredito,valorAbono,fechaPago) Values(idCredi,valorAbo,fechaPa);
		set msg="El abono se ha registrado correctamente.";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarArticulo`(IN `idCategoriaArticulo` INT, IN `descripcionArticulo` VARCHAR(50) CHARSET utf8, IN `cantidadDisponible` INT, IN `precioUnitario` INT)
    NO SQL
INSERT INTO `tblarticulo`(`idCategoriaArticulo`, `descripcionArticulo`, `cantidadDisponible`, `precioUnitario`) VALUES (idCategoriaArticulo,descripcionArticulo,cantidadDisponible,precioUnitario)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCategoriaArticulo`(IN `nombre` VARCHAR(30))
    NO SQL
insert into tblCategoriaArticulo (nombreCategoriaArticulo) values (nombre)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCategoriaCurso`(IN `nombre` VARCHAR(30))
BEGIN
insert into tblCategoriaCurso (nombreCategoriaCurso) values (nombre);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCompra`(IN `numeroFactura` VARCHAR(50), IN `nombreProveedor` VARCHAR(50), IN `fechaCompra` DATE, IN `totalCompra` INT)
    NO SQL
BEGIN
	declare msg varchar(40);    
	if (exists(select numeroFactura from tblCompra where numeroFactura=numeroFactura)) then
		set msg="Esta compra ya fue registrada.";
		select msg as Respuesta;
	else
		insert into tblCompra (numeroFactura,nombreProveedor,fechaCompra,totalCompra) Values(numeroFactu,nombreProveed,fechaComp,totalComp);
		set msg="La compra se ha registrado correctamente.";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCredito`(
    in idCredi      int,
    in idClien      int,
    in fechaInic    datetime,
    in saldoInici   double,
    in saldoActu    double,
    in estadoCredi  tinyint
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select idCliente from tblCredito where idCliente=idClien and saldoActual>0)) then
		set msg="Este cliente ya tiene un credito activo.";
		select msg as Respuesta;
       	else
		insert into tblCredito (idCliente,fechaInicio,saldoInicial,saldoActual,estadoCredito) 
                Values(idClien,fechaInic,saldoInic,saldoActu,estadoCredi);
		set msg="El credito ha sido registrado correctamente.";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCurso`(
nombre varchar(30), duracion int, estado int, descripcion varchar(100), idcategoria int
)
BEGIN
INSERT INTO `dbworkstationsoftware`.`tblcurso`
(`nombreCurso`,
`duracionCurso`,
`estadoCurso`,
`descripcionCurso`,
`tblcategoriacurso_idtblCategoriaCurso`)
VALUES
(nombre,
duracion,
estado,
descripcion,
idcategoria);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarDetalleCompra`(
    in idDetalleComp	int,
    in idcomp		    int,
    in idarticu	        int,
    in cantidadComp		int ,
    in valorUnitar		int 
)
BEGIN
	declare msg varchar(40);    
	if (exists(select idDetalleCompra from tblDetalleCompra where idDetalleCompra=idDetalleComp)) then
		set msg="Este detalle de compra ya existe";
		select msg as Respuesta;
	else
		insert into tblDetalleCompra (idCompra,idArticulo,cantidadCompra,valorUnitario) Values(idcomp,idarticu,cantidadComp,valorUnitar);
		set msg="detalla de compra registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarDetalleVenta`(
    in idDetalleVen	    int,
    in idVen     	    int,
    in idarticu	        int,
    in cantidadVen	    int,
    in descuen		    int,
    in totalDetalleVen  int   
)
BEGIN
	declare msg varchar(40);    
	if (exists(select idDetalleVenta from tblDetalleVenta where idDetalleVenta=idDetalleven)) then
		set msg="Este detalle de venta ya existe";
		select msg as Respuesta;
	else
		insert into tblDetalleVenta (idVenta,idArticulo,cantidadVenta,descuento,totalDetalleVenta) Values(idVen,idarticu,cantidadVen,descuen,totalDetalleVen);
		set msg="Detalla de venta registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarEmpresa`(
    in nitEmpre         varchar(20),
    in nombreEmpre    	varchar(50),
    in direccionEmpre   varchar(50),
    in nombreContac     varchar(50),
    in telefonoContac	varchar(50),
    in emailContac	varchar(50)
    
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select nitEmpresa from tblEmpresa where nitEmpresa=nitEmpre)) then
		set msg="Esta empresa ya existe";
		select msg as Respuesta;
	else
		insert into tblEmpresa (nitEmpresa,nombreEmpresa,direccionEmpresa,nombreContacto,telefonoContacto,emailContacto) Values(nitEmpre,nombreEmpre,direccionEmpre,nombreContac,telefonoContac,emailContac);
		set msg="La empresa se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarEstudiante`(IN `tipoDocumen` VARCHAR(5),
 IN `numeroDocumen` VARCHAR(20),
 IN `fechaNacimien` date,
 IN `generoClien` INT,
 IN `nombreClien` VARCHAR(50),
 IN `apellidoClien` VARCHAR(50),
 IN `direccionClien` VARCHAR(50),
 IN `telefonoFi` VARCHAR(15),
 IN `telefonoMov` VARCHAR(15),
 IN `emailClien` VARCHAR(50),
 IN `estado` INT,
 IN `tipoDocAcudien` varchar(5),
 IN `numDocAcudien` varchar (15)
)
BEGIN
INSERT INTO `tblestudiante`
    (`tipoDocumento`, `numeroDocumento`, `fechaNacimiento`, `nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoFijo`, `telefonoMovil`, `emailCliente`, `estadoEstudiante`, `generoCliente`, `tblacudiente_tipoDocumento`, `tblacudiente_numeroDocumento`)
VALUES (tipoDocumen,numeroDocumen,fechaNacimien,nombreClien,apellidoClien,direccionClien,telefonoFi,telefonoMov,emailClien,estado,generoClien,tipoDocAcudien,numDocAcudien);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarFactura`(
    in idFactu       int,
    in fechafactu    datetime,
    in totalFactu    varchar(50)
    
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select idFactura from tblFactura where idFactura=idFactu)) then
		set msg="Esta factura ya existe";
		select msg as Respuesta;
	else
		insert into tblFactura (fechaFactura,totalFactura) Values(fechafactu,totalFactu);
		set msg="La factura se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarFicha`(
    in id          int,
    in cupos  int,  
    in fecha       date,
    in precio	   int,
in estadoFich int
 )
BEGIN
		insert into tblFicha(tblcurso_idCurso,cuposDisponibles,fechaInicio, precioFicha,estado) Values(id,cupos,fecha, precio, estadoFich);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarInscripcion`(
    in idIncripci       int,
    in idSeminar        int,
    in precioSeminar	int,
    in fechaAsistenc    datetime,
    in idVen            int  
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select idIncripcion from tblInscripcion where idIncripcion=idIncripci)) then
		set msg="Esta inscripciÃ³n ya existe";
		select msg as Respuesta;
	else
		insert into tblInscripcion (idIncripcion,idSeminario, precioSeminario, fechaAsistencia,idVenta) Values(idIncripci,idSeminar,precioSeminar,fechaAsistenc,idVen);
		set msg="La inscripciï¿½ï¿½n se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarMatricula`(
	IN `idMatricu` INT, 
	IN `idFic` INT, 
	IN `fechaInic` DATETIME, 
	IN `fechaF` DATETIME, 
	IN `estadoMatricu` INT, 
	IN `idVen` INT
)
BEGIN
	declare msg varchar(40);    
	if (exists(select idMatricula from tblMatricula where idMatricula=idMatricu)) then
		set msg="Esta matricula ya existe";
		select msg as Respuesta;
	else
		insert into tblMatricula (idFicha,fechaInicio,fechaFin,estadoMatricula,idVenta) Values(idFic,fechaInic,fechaF,estadoMatricu,idVen);
		set msg="La matricula se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarSeminario`(IN `nombreSeminar` VARCHAR(50), IN `duracionSeminar` INT, IN `estadoSeminar` INT)
BEGIN
        insert into tblSeminario (nombreSeminario,duracionSeminario,estadoSeminario) Values(nombreSeminar,duracionSeminar,estadoSeminar);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarSubsidio`(IN `idSubsid` INT, IN `nitEmpre` INT, IN `idClien` VARCHAR(30), IN `fechaAsignaci` DATETIME, IN `valorSubsid` int)
BEGIN
	declare msg varchar(40);    
	if (exists(select idSubsideo from tblSubsideo where idSubsidio=idSubsid)) then
		set msg="Este subsidio ya existe";
		select msg as Respuesta;
	else
		insert into tblSubsidio (nitEmpresa,idCliente,fechaAsignacion,valorSubsidio) Values(nitEmpre,idClien,fechaAsignaci,valorSubsid);
		set msg="Este subsidio se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarVenta`(
    in idVen                int,
    in fechaVen             datetime,
    in totalVen             int,
    in idFactu int,
    in idClien VARCHAR(30) 
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select idVenta from tblVenta where idVenta=idVen)) then
		set msg="Este subsideo ya existe";
		select msg as Respuesta;
	else
		insert into tblVenta (fechaVenta,totalVenta,idFactura,idCliente) Values(fechaVen,totalVen,idFactu,idClien);
		set msg="Este subsideo se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarAbonos`()
select * from tblAbono a inner join tblCredito c on(a.idCredito=c.idCredito) 
order by (a.idCredito,a.fechaPago)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarArticulos`()
BEGIN

SELECT * FROM tblarticulo INNER JOIN tblcategoriaarticulo ON tblarticulo.idCategoriaArticulo = tblcategoriaarticulo.idCategoriaArticulo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarCompras`(IN `numeroFactura` VARCHAR(50), IN `nombreProveedor` VARCHAR(50), IN `fechaCompra` DATE, IN `totalCompra` INT)
    NO SQL
BEGIN
SELECT * FROM tblCompra;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarEmpresas`()
BEGIN

SELECT * FROM tblEmpresa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblabono`
--

CREATE TABLE IF NOT EXISTS `tblabono` (
  `idAbono` int(11) NOT NULL AUTO_INCREMENT,
  `valorAbono` int(11) NOT NULL DEFAULT '0',
  `fechaPago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idCredito` int(11) NOT NULL,
  PRIMARY KEY (`idAbono`),
  KEY `fk_tblabono_tblcredito1_idx` (`idCredito`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblacudiente`
--

CREATE TABLE IF NOT EXISTS `tblacudiente` (
  `tipoDocumento` varchar(5) NOT NULL,
  `numeroDocumento` varchar(15) NOT NULL,
  `nombreAcudiente` varchar(50) NOT NULL,
  `telefonoAcudiente` varchar(50) NOT NULL,
  PRIMARY KEY (`tipoDocumento`,`numeroDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblarticulo`
--

CREATE TABLE IF NOT EXISTS `tblarticulo` (
  `idArticulo` int(11) NOT NULL AUTO_INCREMENT,
  `idCategoriaArticulo` int(11) NOT NULL,
  `descripcionArticulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidadDisponible` mediumint(9) NOT NULL,
  `precioUnitario` int(11) NOT NULL,
  PRIMARY KEY (`idArticulo`),
  KEY `FK_tblArticulo_idCategoriaArticulo` (`idCategoriaArticulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tblarticulo`
--

INSERT INTO `tblarticulo` (`idArticulo`, `idCategoriaArticulo`, `descripcionArticulo`, `cantidadDisponible`, `precioUnitario`) VALUES
(1, 5, 'Vinilo Aguamarina', 30, 1000),
(2, 1, 'Vinilo Dorado', 30, 1200),
(3, 5, 'Vinilo Plateado', 30, 1200);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategoriaarticulo`
--

CREATE TABLE IF NOT EXISTS `tblcategoriaarticulo` (
  `idCategoriaArticulo` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCategoriaArticulo` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoriaArticulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tblcategoriaarticulo`
--

INSERT INTO `tblcategoriaarticulo` (`idCategoriaArticulo`, `nombreCategoriaArticulo`) VALUES
(1, 'Categoria A'),
(2, 'Categoria B'),
(3, 'Categoria C'),
(4, 'Categoria D'),
(5, 'Vinilos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategoriacurso`
--

CREATE TABLE IF NOT EXISTS `tblcategoriacurso` (
  `idtblCategoriaCurso` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nombreCategoriaCurso` varchar(45) NOT NULL,
  PRIMARY KEY (`idtblCategoriaCurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `tblcategoriacurso`
--

INSERT INTO `tblcategoriacurso` (`idtblCategoriaCurso`, `nombreCategoriaCurso`) VALUES
(1, 'Categoria A'),
(2, 'Categoria B'),
(3, 'Categoria C'),
(4, 'Categoria D'),
(5, 'Categoria E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcompra`
--

CREATE TABLE IF NOT EXISTS `tblcompra` (
  `numeroFactura` varchar(50) NOT NULL,
  `nombreProveedor` varchar(50) NOT NULL,
  `fechaCompra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalCompra` int(11) NOT NULL,
  PRIMARY KEY (`numeroFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcredito`
--

CREATE TABLE IF NOT EXISTS `tblcredito` (
  `idCredito` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `saldoInicial` int(11) NOT NULL DEFAULT '0',
  `saldoActual` int(11) NOT NULL DEFAULT '0',
  `estadoCredito` tinyint(4) NOT NULL,
  `tblestudiante_tipoDocumento` varchar(5) NOT NULL,
  `tblestudiante_numeroDocumento` varchar(15) NOT NULL,
  PRIMARY KEY (`idCredito`),
  KEY `fk_tblcredito_tblestudiante1_idx` (`tblestudiante_tipoDocumento`,`tblestudiante_numeroDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcurso`
--

CREATE TABLE IF NOT EXISTS `tblcurso` (
  `idCurso` int(11) NOT NULL AUTO_INCREMENT,
  `nombreCurso` varchar(50) NOT NULL,
  `duracionCurso` int(11) NOT NULL,
  `estadoCurso` int(11) NOT NULL,
  `descripcionCurso` varchar(100) DEFAULT NULL,
  `tblcategoriacurso_idtblCategoriaCurso` tinyint(4) NOT NULL,
  PRIMARY KEY (`idCurso`),
  KEY `fk_tblcurso_tblcategoriacurso1_idx` (`tblcategoriacurso_idtblCategoriaCurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tblcurso`
--

INSERT INTO `tblcurso` (`idCurso`, `nombreCurso`, `duracionCurso`, `estadoCurso`, `descripcionCurso`, `tblcategoriacurso_idtblCategoriaCurso`) VALUES
(1, 'Oleo', 30, 1, 'El Oleo es todo un arte, amen', 4),
(2, 'PatchWork', 10, 1, 'asdasdasdasdasdasd', 1),
(3, 'Vinilos', 10, 1, 'Es un curso sobre los vinilos', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetallecompra`
--

CREATE TABLE IF NOT EXISTS `tbldetallecompra` (
  `idDetalleCompra` int(11) NOT NULL AUTO_INCREMENT,
  `numeroFactura` varchar(50) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `cantidadComprada` int(11) NOT NULL,
  `valorUnitario` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleCompra`),
  KEY `FK_tblDetalleCompra_idArticulo` (`idArticulo`),
  KEY `FK_tblDetalleCompra_numeroFactura` (`numeroFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetalleventa`
--

CREATE TABLE IF NOT EXISTS `tbldetalleventa` (
  `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT,
  `idVenta` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `cantidadVendida` int(11) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0',
  `totalDetalleVenta` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleVenta`),
  KEY `FK_tblDetalleVenta_idArticulo` (`idArticulo`),
  KEY `FK_tblDetalleVenta_idVenta` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblempresa`
--

CREATE TABLE IF NOT EXISTS `tblempresa` (
  `nitEmpresa` varchar(20) NOT NULL DEFAULT '',
  `nombreEmpresa` varchar(50) NOT NULL,
  `direccionEmpresa` varchar(50) NOT NULL,
  `nombreContacto` varchar(50) NOT NULL,
  `telefonoContacto` varchar(50) NOT NULL,
  `emailContacto` varchar(50) NOT NULL,
  PRIMARY KEY (`nitEmpresa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblempresa`
--

INSERT INTO `tblempresa` (`nitEmpresa`, `nombreEmpresa`, `direccionEmpresa`, `nombreContacto`, `telefonoContacto`, `emailContacto`) VALUES
('1017225673', 'OtherGames S.A.S', 'Calle 24 # 65 e 25', 'Juan Sebastian Montoya', '3218016237', 'thejuansebas03@gmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblestudiante`
--

CREATE TABLE IF NOT EXISTS `tblestudiante` (
  `tipoDocumento` varchar(5) NOT NULL,
  `numeroDocumento` varchar(15) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `nombreCliente` varchar(50) NOT NULL,
  `apellidoCliente` varchar(50) NOT NULL,
  `direccionCliente` varchar(50) NOT NULL,
  `telefonoFijo` varchar(11) NOT NULL,
  `telefonoMovil` varchar(15) NOT NULL,
  `emailCliente` varchar(50) NOT NULL,
  `estadoEstudiante` tinyint(4) NOT NULL,
  `generoCliente` binary(1) NOT NULL,
  `tblacudiente_tipoDocumento` varchar(5) DEFAULT NULL,
  `tblacudiente_numeroDocumento` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`tipoDocumento`,`numeroDocumento`),
  KEY `fk_tblcliente_tblacudiente1_idx` (`tblacudiente_tipoDocumento`,`tblacudiente_numeroDocumento`),
  KEY `tblacudiente_tipoDocumento` (`tblacudiente_tipoDocumento`),
  KEY `tblacudiente_numeroDocumento` (`tblacudiente_numeroDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblestudiante`
--

INSERT INTO `tblestudiante` (`tipoDocumento`, `numeroDocumento`, `fechaNacimiento`, `nombreCliente`, `apellidoCliente`, `direccionCliente`, `telefonoFijo`, `telefonoMovil`, `emailCliente`, `estadoEstudiante`, `generoCliente`, `tblacudiente_tipoDocumento`, `tblacudiente_numeroDocumento`) VALUES
('CC', '1017225672', '2014-10-09', 'Juan', 'Montoya', 'Calle falsa 456', '65432198', '3218015236', 'jsmontoya@misena.edu.co', 0, '1', NULL, 'null'),
('CC', '1017225673', '1994-11-03', 'Juan ', 'Montoya', 'Calle 24 # 65e25', '5861529', '03218016237', 'JuanSMM@outlook.com', 0, '1', NULL, 'null');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblfactura`
--

CREATE TABLE IF NOT EXISTS `tblfactura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `fechaFactura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalFactura` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblficha`
--

CREATE TABLE IF NOT EXISTS `tblficha` (
  `idFicha` int(11) NOT NULL AUTO_INCREMENT,
  `cuposDisponibles` int(11) NOT NULL,
  `fechaInicio` date NOT NULL,
  `tblcurso_idCurso` int(11) NOT NULL,
  `precioFicha` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`idFicha`),
  KEY `fk_tblficha_tblcurso1_idx` (`tblcurso_idCurso`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tblficha`
--

INSERT INTO `tblficha` (`idFicha`, `cuposDisponibles`, `fechaInicio`, `tblcurso_idCurso`, `precioFicha`, `estado`) VALUES
(1, 15, '2015-04-08', 1, 50000, 1),
(2, 15, '2015-04-17', 1, 10000, 1),
(3, 15, '2015-04-30', 3, 50000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblinscripcion`
--

CREATE TABLE IF NOT EXISTS `tblinscripcion` (
  `idInscripcion` int(11) NOT NULL AUTO_INCREMENT,
  `idSeminario` int(11) NOT NULL,
  `precioSeminario` int(20) NOT NULL,
  `fechaAsistencia` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tblVenta_idVenta` int(11) NOT NULL,
  PRIMARY KEY (`idInscripcion`),
  KEY `FK_tblInscripcion_idSeminario` (`idSeminario`),
  KEY `fk_tblInscripcion_tblVenta1_idx` (`tblVenta_idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmatricula`
--

CREATE TABLE IF NOT EXISTS `tblmatricula` (
  `idMatricula` int(11) NOT NULL AUTO_INCREMENT,
  `fechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaFin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estadoMatricula` tinyint(4) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idFicha` int(11) NOT NULL,
  PRIMARY KEY (`idMatricula`),
  KEY `fk_tblmatricula_tblventa1_idx` (`idVenta`),
  KEY `fk_tblmatricula_tblficha1_idx` (`idFicha`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmodulo`
--

CREATE TABLE IF NOT EXISTS `tblmodulo` (
  `idmodulo` int(11) NOT NULL AUTO_INCREMENT,
  `enlace` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`idmodulo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `tblmodulo`
--

INSERT INTO `tblmodulo` (`idmodulo`, `enlace`, `nombre`) VALUES
(1, 'matricula.jsp', 'Gestión de Matriculas'),
(2, 'empresa.jsp', 'Gestión de Empresas'),
(3, 'curso.jsp', 'Gestión de Cursos y Seminarios'),
(5, 'articulo.jsp', 'Gestión de Artículos'),
(6, 'caja.jsp', 'Caja Registradora'),
(7, 'nuestro.jsp', 'Nuestros Cursos'),
(8, 'acerca.jsp', 'Acerca de Nosotros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmodulorol`
--

CREATE TABLE IF NOT EXISTS `tblmodulorol` (
  `idmodulo` int(11) NOT NULL,
  `idrol` int(11) NOT NULL,
  PRIMARY KEY (`idmodulo`,`idrol`),
  KEY `idrol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblmodulorol`
--

INSERT INTO `tblmodulorol` (`idmodulo`, `idrol`) VALUES
(1, 1),
(2, 1),
(3, 1),
(5, 1),
(6, 1),
(7, 3),
(8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrol`
--

CREATE TABLE IF NOT EXISTS `tblrol` (
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tblrol`
--

INSERT INTO `tblrol` (`nombre`, `descripcion`, `idrol`) VALUES
('administrador', 'Es quien administra el sistema', 1),
('operador', 'privilegios por debajo del administrador', 2),
('comun', 'usuario sin registro', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblseminario`
--

CREATE TABLE IF NOT EXISTS `tblseminario` (
  `idSeminario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreSeminario` varchar(50) NOT NULL,
  `duracionSeminario` int(11) NOT NULL,
  `estadoSeminario` int(11) NOT NULL,
  PRIMARY KEY (`idSeminario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `tblseminario`
--

INSERT INTO `tblseminario` (`idSeminario`, `nombreSeminario`, `duracionSeminario`, `estadoSeminario`) VALUES
(1, 'Seminario de PatchWork', 10, 1),
(2, 'Seminario de Pintura', 10, 1),
(3, 'Seminario de Oleo', 4, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsubsidio`
--

CREATE TABLE IF NOT EXISTS `tblsubsidio` (
  `idSubsidio` int(11) NOT NULL AUTO_INCREMENT,
  `fechaAsignacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valorSubsidio` int(11) NOT NULL,
  `tblempresa_nitEmpresa` varchar(20) NOT NULL,
  `tblestudiante_tipoDocumento` varchar(5) NOT NULL,
  `tblestudiante_numeroDocumento` varchar(15) NOT NULL,
  PRIMARY KEY (`idSubsidio`),
  KEY `fk_tblsubsidio_tblempresa1_idx` (`tblempresa_nitEmpresa`),
  KEY `fk_tblsubsidio_tblestudiante1_idx` (`tblestudiante_tipoDocumento`,`tblestudiante_numeroDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuario`
--

CREATE TABLE IF NOT EXISTS `tblusuario` (
  `idUsuario` int(11) NOT NULL,
  `nombreUsuario` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `idrol` int(1) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idrol` (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblusuario`
--

INSERT INTO `tblusuario` (`idUsuario`, `nombreUsuario`, `password`, `email`, `telefono`, `idrol`) VALUES
(1, 'admin', '123', 'admin@misena.edu.co', '5861529', 1),
(2, 'usuario', '123', 'usuario@misena.edu.co', '3216545', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblventa`
--

CREATE TABLE IF NOT EXISTS `tblventa` (
  `idVenta` int(11) NOT NULL AUTO_INCREMENT,
  `fechaVenta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalVenta` int(11) NOT NULL,
  `tblfactura_idFactura` int(11) NOT NULL,
  `tblusuario_idUsuario` int(11) NOT NULL,
  `tblestudiante_tipoDocumento` varchar(5) NOT NULL,
  `tblestudiante_numeroDocumento` varchar(15) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_tblventa_tblfactura1_idx` (`tblfactura_idFactura`),
  KEY `fk_tblventa_tblusuario1_idx` (`tblusuario_idUsuario`),
  KEY `fk_tblventa_tblestudiante1_idx` (`tblestudiante_tipoDocumento`,`tblestudiante_numeroDocumento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblabono`
--
ALTER TABLE `tblabono`
  ADD CONSTRAINT `tblabono_ibfk_1` FOREIGN KEY (`idCredito`) REFERENCES `tblcredito` (`idCredito`);

--
-- Filtros para la tabla `tblarticulo`
--
ALTER TABLE `tblarticulo`
  ADD CONSTRAINT `FK_tblArticulo_idCategoriaArticulo` FOREIGN KEY (`idCategoriaArticulo`) REFERENCES `tblcategoriaarticulo` (`idCategoriaArticulo`);

--
-- Filtros para la tabla `tblcredito`
--
ALTER TABLE `tblcredito`
  ADD CONSTRAINT `fk_tblcredito_tblestudiante1` FOREIGN KEY (`tblestudiante_tipoDocumento`, `tblestudiante_numeroDocumento`) REFERENCES `tblestudiante` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
  ADD CONSTRAINT `fk_tblcurso_tblcategoriacurso1` FOREIGN KEY (`tblcategoriacurso_idtblCategoriaCurso`) REFERENCES `tblcategoriacurso` (`idtblCategoriaCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
  ADD CONSTRAINT `FK_tblDetalleVenta_idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `tblarticulo` (`idArticulo`),
  ADD CONSTRAINT `FK_tblDetalleVenta_idVenta` FOREIGN KEY (`idVenta`) REFERENCES `tblventa` (`idVenta`);

--
-- Filtros para la tabla `tblestudiante`
--
ALTER TABLE `tblestudiante`
  ADD CONSTRAINT `fk_tblcliente_tblacudiente1` FOREIGN KEY (`tblacudiente_tipoDocumento`, `tblacudiente_numeroDocumento`) REFERENCES `tblacudiente` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblficha`
--
ALTER TABLE `tblficha`
  ADD CONSTRAINT `fk_tblficha_tblcurso1` FOREIGN KEY (`tblcurso_idCurso`) REFERENCES `tblcurso` (`idCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblinscripcion`
--
ALTER TABLE `tblinscripcion`
  ADD CONSTRAINT `FK_tblInscripcion_idSeminario` FOREIGN KEY (`idSeminario`) REFERENCES `tblseminario` (`idSeminario`),
  ADD CONSTRAINT `fk_tblInscripcion_tblVenta1` FOREIGN KEY (`tblVenta_idVenta`) REFERENCES `tblventa` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblmatricula`
--
ALTER TABLE `tblmatricula`
  ADD CONSTRAINT `fk_tblmatricula_tblventa1` FOREIGN KEY (`idVenta`) REFERENCES `tblventa` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tblmatricula_ibfk_1` FOREIGN KEY (`idFicha`) REFERENCES `tblficha` (`idFicha`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tblmodulorol`
--
ALTER TABLE `tblmodulorol`
  ADD CONSTRAINT `tblmodulorol_ibfk_1` FOREIGN KEY (`idmodulo`) REFERENCES `tblmodulo` (`idmodulo`),
  ADD CONSTRAINT `tblmodulorol_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `tblrol` (`idrol`);

--
-- Filtros para la tabla `tblsubsidio`
--
ALTER TABLE `tblsubsidio`
  ADD CONSTRAINT `fk_tblsubsidio_tblempresa1` FOREIGN KEY (`tblempresa_nitEmpresa`) REFERENCES `tblempresa` (`nitEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblsubsidio_tblestudiante1` FOREIGN KEY (`tblestudiante_tipoDocumento`, `tblestudiante_numeroDocumento`) REFERENCES `tblestudiante` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
  ADD CONSTRAINT `tblusuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `tblrol` (`idrol`);

--
-- Filtros para la tabla `tblventa`
--
ALTER TABLE `tblventa`
  ADD CONSTRAINT `fk_tblventa_tblestudiante1` FOREIGN KEY (`tblestudiante_tipoDocumento`, `tblestudiante_numeroDocumento`) REFERENCES `tblestudiante` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblventa_tblfactura1` FOREIGN KEY (`tblfactura_idFactura`) REFERENCES `tblfactura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tblventa_tblusuario1` FOREIGN KEY (`tblusuario_idUsuario`) REFERENCES `tblusuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
