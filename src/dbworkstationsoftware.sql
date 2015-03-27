-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-03-2015 a las 02:46:27
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `dbworkstationsoftware`
--
DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE spIngresarCategoriaCurso
(IN `nombre` VARCHAR(30))
BEGIN
insert into tblCategoriaCurso (nombreCategoriaCurso) values (nombre);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarArticulo`(
    in idArticu				int,
	in idCategoriaArticu	int,
	in descripcionArticu	varchar(50),
	in cantidadDisponib		int,
	in precioUnitar			int
)
BEGIN
	declare msg varchar(40);   
	update tblArticulo set idCategoriaArticulo=idCategoriaArticu,descripcionArticulo=descripcionArticu,cantidadDisponible=cantidadDisponib,precioUnitario=precioUnitar
		where idArticulo=idArticu;
	set msg="Artículo actualizado exitosamente";	
    select msg as Respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCategoriaArticulo`(
    in idCategoriaArticu			int,
	in nombreCategoriaArticu	varchar(50)
)
BEGIN
	declare msg varchar(40);    
	update tblCategoriaArticulo set nombreCategoriaArticulo=nombreCategoriaArticu where idCategoriaArticulo=idCategoriaArticu;
	set msg="Categoría actualizada correctamente";
	select msg as Respuesta; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCliente`(IN `idClien` VARCHAR(30), IN `tipoClien` INT, IN `tipoDocumen` VARCHAR(5), IN `numeroDocumen` VARCHAR(15), IN `fechaNacimien` DATETIME, IN `generoClien` INT, IN `nombreClien` VARCHAR(50), IN `apellidoClien` VARCHAR(50), IN `direccionClien` VARCHAR(50), IN `telefonoFi` INT, IN `telefonoMov` INT, IN `emailClien` VARCHAR(50), IN `idAcudien` INT)
BEGIN
	declare msg varchar(40);    

    update tblcliente set direccionCliente=direccionClien,telefonoFijo=telefonoFi,telefonoMovil=telefonoMovil,emailCliente=emailClien,idAcudiente=idAcudien
        where idCliente=idClien;

    set msg="Datos del cliente actualizados correctamente.";
    
    select msg as Respuesta; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCredito`(
    in idCredi		int,
    in idSaldoActu	int,
    in estadoCredi	int
)
BEGIN
	declare msg varchar(40);   
	update tblCredito set idSaldoActual=idSaldoActu,estadoCredito=estadoCredi
		where idCredito=idCredi;
	set msg="Crédito actualizado correctamente";
    select msg as Respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCurso`(
    in idCur			int,
	in nombreCur		varchar(50),
	in duracionCur		int,
	in precioCur		int,
	in estadoCur		int
)
BEGIN
	declare msg varchar(40);    
	update tblCurso set nombreCurso=nombreCur,duracionCurso=duracionCur, precioCurso=precioCur, estadoCurso=estadoCur where idCurso=idCur;
	set msg="Curso editado correctamente";
	select msg as Respuesta; 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarFicha`(
    in idFic			int,
	in idCurs			int,
	in cuposDisponibl	int,
	in fechaInic		datetime
)
BEGIN
	declare msg varchar(40);    
	update tblFicha set idCurso=idCur,cuposDisponibles=cuposDisponibl,fechaInicio=fechaInic where idFicha=idFic;
	set msg="Ficha editada correctamente";
	select msg as Respuesta; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarMatricula`(
    in idMatricu			int,
	in estadoMatricu		int,
	in fechaInic			datetime
)
BEGIN
	declare msg varchar(40);    
	update tblCategoriaArticulo set nombreCategoriaArticulo=nombreCategoriaArticu where idCategoriaArticulo=idCategoriaArticu;
	set msg="Matrícula actualizada correctamente";
	select msg as Respuesta; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarSeminario`(
    in idSeminar			int,
	in nombreSeminar		varchar(50),
	in duracionSeminar		int,
	in estadoSeminar		int
)
BEGIN
	declare msg varchar(40);    
	update tblSeminario set nombreSeminario=nombreSeminar,duracionSeminario=duracionSeminar,estadoSeminario=estadoSeminar
	 where idSeminario=idSeminar;
	set msg="Seminario editado correctamente";
	select msg as Respuesta; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarArticuloByNombre`(IN `nombre` VARCHAR(50))
    NO SQL
select idArticulo, descripcionArticulo, precioUnitario, cantidadDisponible, nombreCategoriaArticulo from tblArticulo a inner join tblCategoriaArticulo ca on(a.idCategoriaArticulo=ca.idCategoriaArticulo) where descripcionArticulo like concat('%',nombre,'%')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarClientesCreditosActivos`(
 )
BEGIN
	
	select tblCliente.nombreCliente, tblCliente.apellidoCliente, tblCliente.telefonoFijo, tblCliente.telefonomovil, tblCliente.emailCliente, tblCredito.saldoActual 
	from tblCliente inner join tblCredito on tblCliente.idCliente = tblCredito.idCliente;
END$$

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
    nombreCategoriaCurso
FROM tblcurso c inner join categoriaCurso cc on(c.idtblCategoriaCurso=cc.idtblCategoriaCurso) where idCurso =id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCursos`()
BEGIN
SELECT idCurso,
    nombreCurso,
    duracionCurso,
    estadoCurso,
    descripcionCurso,
    nombreCategoriaCurso
FROM tblcurso c inner join tblCategoriaCurso cc on(c.tblcategoriacurso_idtblCategoriaCurso=cc.idtblCategoriaCurso);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarDetallesCompra`(
	in idComp	int
)
BEGIN
	select * from tblDetalleCompra
	where idCompra = idComp
	order by idArticulo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarFichas`()
BEGIN
SELECT `idFicha`,
    `cuposDisponibles`,
    `fechaInicio`,
    `precioFicha`,
    nombreCurso,
    estado
FROM `tblficha` f inner join tblCurso c on(f.tblCurso_idCurso=c.idCurso);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarFichasPorID`(id int)
BEGIN
SELECT `idFicha`,
    `cuposDisponibles`,
    `fechaInicio`,
    `tblcurso_idCurso`,
    `precioFicha`
FROM `tblficha` where idFicha = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarInscritosSeminario`(
    in idSeminar       int
 )
BEGIN
	declare msg varchar(40);    
	select count(*) as Inscritos from tblInscripcion where idSeminario = idSeminar;
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarArticulo`(IN `idCategoriaArticulo` INT, IN `descripcionArticulo` VARCHAR(50) CHARSET utf8, IN `cantidadDisponible` INT, IN `precioUnitario` INT)
    NO SQL
INSERT INTO `tblarticulo`(`idCategoriaArticulo`, `descripcionArticulo`, `cantidadDisponible`, `precioUnitario`) VALUES (idCategoriaArticulo,descripcionArticulo,cantidadDisponible,precioUnitario)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCategoriaArticulo`(IN `nombre` VARCHAR(30))
    NO SQL
insert into tblCategoriaArticulo (nombreCategoriaArticulo) values (nombre)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCliente`(IN `idClien` VARCHAR(30), IN `tipoClien` INT, IN `tipoDocumen` VARCHAR(5), IN `numeroDocumen` VARCHAR(15), IN `fechaNacimien` DATETIME, IN `generoClien` INT, IN `nombreClien` VARCHAR(50), IN `apellidoClien` VARCHAR(50), IN `direccionClien` VARCHAR(50), IN `telefonoFi` VARCHAR(15), IN `telefonoMov` VARCHAR(15), IN `emailClien` VARCHAR(50), IN `idAcudien` INT)
BEGIN
	declare msg varchar(40);    
	if (exists(select idCliente from tblCliente where idCliente=idClien)) then
		set msg="Este cliente ya existe";
		select msg as Respuesta;
    elseif(idAcudien=0) then
    		insert into tblCliente (tipoCliente,tipoDocumento,numeroDocumento,fechaNacimiento,generoCliente,nombreCliente,apellidoCliente,direccionCliente,telefonoFijo,telefonoMovil,emailCliente) Values(tipoClien,tipoDocumen,numeroDocumen,fechaNacimien,generoClien,nombreClien,apellidoClien,direccionClien,telefonoFi,telefonoMov,emailClien);
		set msg="Cliente registrado exitosamente";
		select msg as Respuesta; 
        
	else
		insert into tblCliente (tipoCliente,tipoDocumento,numeroDocumento,fechaNacimiento,generoCliente,nombreCliente,apellidoCliente,direccionCliente,telefonoFijo,telefonoMovil,emailCliente,idAcudiente) Values(tipoClien,tipoDocumen,numeroDocumen,fechaNacimien,generoClien,nombreClien,apellidoClien,direccionClien,telefonoFi,telefonoMov,emailClien,idAcudien);
		set msg="Cliente registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCurso`(
nombre varchar(30), duracion datetime, estado int, descripcion varchar(50), idcategoria int
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
    in telefonoContac	varchar(50),
    in emailContac		varchar(50)
    
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select nitEmpresa from tblEmpresa where nitEmpresa=nitEmpre)) then
		set msg="Esta empresa ya existe";
		select msg as Respuesta;
	else
		insert into tblEmpresa (nombreEmpresa,direccionEmpresa,telefonoContacto,emailContacto) Values(nombreEmpre,direccionEmpre,telefonoContac,emailContac);
		set msg="La empresa se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarFicha`(
    in id          int,
    in cupos  int,  
    in fecha       datetime,
    in precio	   int
 )
BEGIN
	declare msg varchar(40);    
		insert into tblFicha(idCurso,cuposDisponibles,fechaInicio, precioFicha) Values(id,cupos,fecha, precio);
		set msg="La ficha se ha registrado exitosamente";
		select msg as Respuesta; 
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarSeminario`(
    in nombreSeminar    varchar(50),
    in duracionSeminar  int,
    in estadoSeminar    int
 )
BEGIN
        insert into tblSeminario (nombreSeminar,duracionSeminar,estadoSeminar) Values(nombreSeminar,duracionSeminar,estadoSeminar);
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertarFactura`(
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `spInsertarInscripcion`(
    in idIncripci       int,
    in idSeminar        int,
	in precioSeminar	int,
    in fechaAsistenc    datetime,
    in idVen   int  
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select idIncripcion from tblInscripcion where idIncripcion=idIncripci)) then
		set msg="Esta inscripción ya existe";
		select msg as Respuesta;
	else
		insert into tblInscripcion (idIncripcion,idSeminario, precioSeminario, fechaAsistencia,idVenta) Values(idIncripci,idSeminar,precioSeminar,fechaAsistenc,idVen);
		set msg="La inscripción se ha registrado exitosamente";
		select msg as Respuesta; 
	end if;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblabono`
--

CREATE TABLE IF NOT EXISTS `tblabono` (
`idAbono` int(11) NOT NULL,
  `valorAbono` int(11) NOT NULL DEFAULT '0',
  `fechaPago` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tblcredito_idCredito` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblacudiente`
--

CREATE TABLE IF NOT EXISTS `tblacudiente` (
  `tipoDocumento` varchar(5) NOT NULL,
  `numeroDocumento` varchar(15) NOT NULL,
  `nombreAcudiente` varchar(50) NOT NULL,
  `telefonoAcudiente` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblarticulo`
--

CREATE TABLE IF NOT EXISTS `tblarticulo` (
`idArticulo` int(11) NOT NULL,
  `idCategoriaArticulo` int(11) NOT NULL,
  `descripcionArticulo` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `cantidadDisponible` mediumint(9) NOT NULL,
  `precioUnitario` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- Estructura de tabla para la tabla `tblcategoriaarticulo`
--

CREATE TABLE IF NOT EXISTS `tblcategoriaarticulo` (
`idCategoriaArticulo` int(11) NOT NULL,
  `nombreCategoriaArticulo` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategoriacurso`
--

CREATE TABLE IF NOT EXISTS `tblcategoriacurso` (
  `idtblCategoriaCurso` tinyint(4) NOT NULL ,
  `nombreCategoriaCurso` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcliente`
--

CREATE TABLE IF NOT EXISTS `tblcliente` (
  `tipoDocumento` varchar(5) NOT NULL,
  `numeroDocumento` varchar(15) NOT NULL,
  `tipoCliente` int(11) NOT NULL,
  `fechaNacimiento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nombreCliente` varchar(50) NOT NULL,
  `apellidoCliente` varchar(50) NOT NULL,
  `direccionCliente` varchar(50) NOT NULL,
  `telefonoFijo` varchar(11) NOT NULL,
  `telefonoMovil` varchar(15) NOT NULL,
  `emailCliente` varchar(50) NOT NULL,
  `estadoEstudiante` tinyint(4) NOT NULL,
  `generoCliente` binary(1) NOT NULL,
  `tblacudiente_tipoDocumento` varchar(5) DEFAULT NULL,
  `tblacudiente_numeroDocumento` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcompra`
--

CREATE TABLE IF NOT EXISTS `tblcompra` (
`idCompra` int(11) NOT NULL,
  `fechaCompra` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalCompra` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcredito`
--

CREATE TABLE IF NOT EXISTS `tblcredito` (
`idCredito` int(11) NOT NULL,
  `fechaInicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `saldoInicial` int(11) NOT NULL DEFAULT '0',
  `saldoActual` int(11) NOT NULL DEFAULT '0',
  `estadoCredito` tinyint(4) NOT NULL,
  `tblcliente_tipoDocumento` varchar(5) NOT NULL,
  `tblcliente_numeroDocumento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcurso`
--

CREATE TABLE IF NOT EXISTS `tblcurso` (
`idCurso` int(11) NOT NULL,
  `nombreCurso` varchar(50) NOT NULL,
  `duracionCurso` int(11) NOT NULL,
  `estadoCurso` int(11) NOT NULL,
  `descripcionCurso` varchar(45) DEFAULT NULL,
  `tblcategoriacurso_idtblCategoriaCurso` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetallecompra`
--

CREATE TABLE IF NOT EXISTS `tbldetallecompra` (
`idDetalleCompra` int(11) NOT NULL,
  `idCompra` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `cantidadComprada` int(11) NOT NULL,
  `valorUnitario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetalleventa`
--

CREATE TABLE IF NOT EXISTS `tbldetalleventa` (
`idDetalleVenta` int(11) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idArticulo` int(11) NOT NULL,
  `cantidadVendida` int(11) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0',
  `totalDetalleVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `emailContacto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblfactura`
--

CREATE TABLE IF NOT EXISTS `tblfactura` (
`idFactura` int(11) NOT NULL,
  `fechaFactura` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalFactura` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblficha`
--

CREATE TABLE IF NOT EXISTS `tblficha` (
  `idFicha` int(11) NOT NULL DEFAULT '0',
  `cuposDisponibles` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL,
  `tblcurso_idCurso` int(11) NOT NULL,
  `precioFicha` int(11) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblinscripcion`
--

CREATE TABLE IF NOT EXISTS `tblinscripcion` (
`idInscripcion` int(11) NOT NULL,
  `idSeminario` int(11) NOT NULL,
  `precioSeminario` int(20) NOT NULL,
  `fechaAsistencia` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `tblVenta_idVenta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmatricula`
--

CREATE TABLE IF NOT EXISTS `tblmatricula` (
`idMatricula` int(11) NOT NULL,
  `fechaInicio` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaFin` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `estadoMatricula` tinyint(4) NOT NULL,
  `idVenta` int(11) NOT NULL,
  `idFicha` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmodulo`
--

CREATE TABLE IF NOT EXISTS `tblmodulo` (
`idmodulo` int(11) NOT NULL,
  `enlace` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblmodulo`
--

INSERT INTO `tblmodulo` (`idmodulo`, `enlace`, `nombre`) VALUES
(1, 'matricula.jsp', 'Gestion de Matriculas'),
(2, 'empresa.jsp', 'Gestion de Empresas'),
(3, 'curso.jsp', 'Gestion de Cursos y Seminarios'),
(5, 'articulo.jsp', 'Gestion de Articulos'),
(6, 'caja.jsp', 'Caja Registradora'),
(7, 'nuestro.jsp', 'Nuestros Cursos'),
(8, 'acerca.jsp', 'Acerca de Nosotros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmodulorol`
--

CREATE TABLE IF NOT EXISTS `tblmodulorol` (
  `idmodulo` int(11) NOT NULL,
  `idrol` int(11) NOT NULL
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
`idrol` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
`idSeminario` int(11) NOT NULL,
  `nombreSeminario` varchar(50) NOT NULL,
  `duracionSeminario` int(11) NOT NULL,
  `estadoSeminario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsubsidio`
--

CREATE TABLE IF NOT EXISTS `tblsubsidio` (
`idSubsidio` int(11) NOT NULL,
  `fechaAsignacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valorSubsidio` int(11) NOT NULL,
  `tblempresa_nitEmpresa` varchar(20) NOT NULL,
  `tblcliente_tipoDocumento` varchar(5) NOT NULL,
  `tblcliente_numeroDocumento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `idrol` int(1) NOT NULL
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
`idVenta` int(11) NOT NULL,
  `fechaVenta` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalVenta` int(11) NOT NULL,
  `tblfactura_idFactura` int(11) NOT NULL,
  `tblusuario_idUsuario` int(11) NOT NULL,
  `tblcliente_tipoDocumento` varchar(5) NOT NULL,
  `tblcliente_numeroDocumento` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblabono`
--
ALTER TABLE `tblabono`
 ADD PRIMARY KEY (`idAbono`), ADD KEY `fk_tblabono_tblcredito1_idx` (`tblcredito_idCredito`);

--
-- Indices de la tabla `tblacudiente`
--
ALTER TABLE `tblacudiente`
 ADD PRIMARY KEY (`tipoDocumento`,`numeroDocumento`);

--
-- Indices de la tabla `tblarticulo`
--
ALTER TABLE `tblarticulo`
 ADD PRIMARY KEY (`idArticulo`), ADD KEY `FK_tblArticulo_idCategoriaArticulo` (`idCategoriaArticulo`);

--
-- Indices de la tabla `tblcategoriaarticulo`
--
ALTER TABLE `tblcategoriaarticulo`
 ADD PRIMARY KEY (`idCategoriaArticulo`);

--
-- Indices de la tabla `tblcategoriacurso`
--
ALTER TABLE `tblcategoriacurso`
 ADD PRIMARY KEY (`idtblCategoriaCurso`);

--
-- Indices de la tabla `tblcliente`
--
ALTER TABLE `tblcliente`
 ADD PRIMARY KEY (`tipoDocumento`,`numeroDocumento`), ADD KEY `fk_tblcliente_tblacudiente1_idx` (`tblacudiente_tipoDocumento`,`tblacudiente_numeroDocumento`), ADD KEY `tblacudiente_tipoDocumento` (`tblacudiente_tipoDocumento`), ADD KEY `tblacudiente_numeroDocumento` (`tblacudiente_numeroDocumento`);

--
-- Indices de la tabla `tblcompra`
--
ALTER TABLE `tblcompra`
 ADD PRIMARY KEY (`idCompra`);

--
-- Indices de la tabla `tblcredito`
--
ALTER TABLE `tblcredito`
 ADD PRIMARY KEY (`idCredito`), ADD KEY `fk_tblcredito_tblcliente1_idx` (`tblcliente_tipoDocumento`,`tblcliente_numeroDocumento`);

--
-- Indices de la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
 ADD PRIMARY KEY (`idCurso`), ADD KEY `fk_tblcurso_tblcategoriacurso1_idx` (`tblcategoriacurso_idtblCategoriaCurso`);

--
-- Indices de la tabla `tbldetallecompra`
--
ALTER TABLE `tbldetallecompra`
 ADD PRIMARY KEY (`idDetalleCompra`), ADD KEY `FK_tblDetalleCompra_idArticulo` (`idArticulo`), ADD KEY `FK_tblDetalleCompra_idCompra` (`idCompra`);

--
-- Indices de la tabla `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
 ADD PRIMARY KEY (`idDetalleVenta`), ADD KEY `FK_tblDetalleVenta_idArticulo` (`idArticulo`), ADD KEY `FK_tblDetalleVenta_idVenta` (`idVenta`);

--
-- Indices de la tabla `tblempresa`
--
ALTER TABLE `tblempresa`
 ADD PRIMARY KEY (`nitEmpresa`);

--
-- Indices de la tabla `tblfactura`
--
ALTER TABLE `tblfactura`
 ADD PRIMARY KEY (`idFactura`);

--
-- Indices de la tabla `tblficha`
--
ALTER TABLE `tblficha`
 ADD PRIMARY KEY (`idFicha`), ADD KEY `fk_tblficha_tblcurso1_idx` (`tblcurso_idCurso`);

--
-- Indices de la tabla `tblinscripcion`
--
ALTER TABLE `tblinscripcion`
 ADD PRIMARY KEY (`idInscripcion`), ADD KEY `FK_tblInscripcion_idSeminario` (`idSeminario`), ADD KEY `fk_tblInscripcion_tblVenta1_idx` (`tblVenta_idVenta`);

--
-- Indices de la tabla `tblmatricula`
--
ALTER TABLE `tblmatricula`
 ADD PRIMARY KEY (`idMatricula`), ADD KEY `fk_tblmatricula_tblventa1_idx` (`idVenta`), ADD KEY `fk_tblmatricula_tblficha1_idx` (`idFicha`);

--
-- Indices de la tabla `tblmodulo`
--
ALTER TABLE `tblmodulo`
 ADD PRIMARY KEY (`idmodulo`);

--
-- Indices de la tabla `tblmodulorol`
--
ALTER TABLE `tblmodulorol`
 ADD PRIMARY KEY (`idmodulo`,`idrol`), ADD KEY `idrol` (`idrol`);

--
-- Indices de la tabla `tblrol`
--
ALTER TABLE `tblrol`
 ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tblseminario`
--
ALTER TABLE `tblseminario`
 ADD PRIMARY KEY (`idSeminario`);

--
-- Indices de la tabla `tblsubsidio`
--
ALTER TABLE `tblsubsidio`
 ADD PRIMARY KEY (`idSubsidio`), ADD KEY `fk_tblsubsidio_tblempresa1_idx` (`tblempresa_nitEmpresa`), ADD KEY `fk_tblsubsidio_tblcliente1_idx` (`tblcliente_tipoDocumento`,`tblcliente_numeroDocumento`);

--
-- Indices de la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
 ADD PRIMARY KEY (`idUsuario`), ADD KEY `idrol` (`idrol`);

--
-- Indices de la tabla `tblventa`
--
ALTER TABLE `tblventa`
 ADD PRIMARY KEY (`idVenta`), ADD KEY `fk_tblventa_tblfactura1_idx` (`tblfactura_idFactura`), ADD KEY `fk_tblventa_tblusuario1_idx` (`tblusuario_idUsuario`), ADD KEY `fk_tblventa_tblcliente1_idx` (`tblcliente_tipoDocumento`,`tblcliente_numeroDocumento`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblcategoriacurso`
--
ALTER TABLE `tblcategoriacurso`
 MODIFY `idtblCategoriaCurso` tinyint(4) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tblabono`
--
ALTER TABLE `tblabono`
MODIFY `idAbono` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblarticulo`
--
ALTER TABLE `tblarticulo`
MODIFY `idArticulo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblcategoriaarticulo`
--
ALTER TABLE `tblcategoriaarticulo`
MODIFY `idCategoriaArticulo` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblcompra`
--
ALTER TABLE `tblcompra`
MODIFY `idCompra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblcredito`
--
ALTER TABLE `tblcredito`
MODIFY `idCredito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbldetallecompra`
--
ALTER TABLE `tbldetallecompra`
MODIFY `idDetalleCompra` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
MODIFY `idDetalleVenta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblfactura`
--
ALTER TABLE `tblfactura`
MODIFY `idFactura` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblinscripcion`
--
ALTER TABLE `tblinscripcion`
MODIFY `idInscripcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblmatricula`
--
ALTER TABLE `tblmatricula`
MODIFY `idMatricula` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblmodulo`
--
ALTER TABLE `tblmodulo`
MODIFY `idmodulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `tblrol`
--
ALTER TABLE `tblrol`
MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tblseminario`
--
ALTER TABLE `tblseminario`
MODIFY `idSeminario` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblsubsidio`
--
ALTER TABLE `tblsubsidio`
MODIFY `idSubsidio` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblventa`
--
ALTER TABLE `tblventa`
MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblabono`
--
ALTER TABLE `tblabono`
ADD CONSTRAINT `fk_tblabono_tblcredito1` FOREIGN KEY (`tblcredito_idCredito`) REFERENCES `tblcredito` (`idCredito`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblarticulo`
--
ALTER TABLE `tblarticulo`
ADD CONSTRAINT `FK_tblArticulo_idCategoriaArticulo` FOREIGN KEY (`idCategoriaArticulo`) REFERENCES `tblcategoriaarticulo` (`idCategoriaArticulo`);

--
-- Filtros para la tabla `tblcliente`
--
ALTER TABLE `tblcliente`
ADD CONSTRAINT `fk_tblcliente_tblacudiente1` FOREIGN KEY (`tblacudiente_tipoDocumento`, `tblacudiente_numeroDocumento`) REFERENCES `tblacudiente` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `tblcliente_ibfk_1` FOREIGN KEY (`tblacudiente_tipoDocumento`) REFERENCES `tblacudiente` (`tipoDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblcredito`
--
ALTER TABLE `tblcredito`
ADD CONSTRAINT `fk_tblcredito_tblcliente1` FOREIGN KEY (`tblcliente_tipoDocumento`, `tblcliente_numeroDocumento`) REFERENCES `tblcliente` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
ADD CONSTRAINT `fk_tblcurso_tblcategoriacurso1` FOREIGN KEY (`tblcategoriacurso_idtblCategoriaCurso`) REFERENCES `tblcategoriacurso` (`idtblCategoriaCurso`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tbldetallecompra`
--
ALTER TABLE `tbldetallecompra`
ADD CONSTRAINT `FK_tblDetalleCompra_idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `tblarticulo` (`idArticulo`),
ADD CONSTRAINT `FK_tblDetalleCompra_idCompra` FOREIGN KEY (`idCompra`) REFERENCES `tblcompra` (`idCompra`);

--
-- Filtros para la tabla `tbldetalleventa`
--
ALTER TABLE `tbldetalleventa`
ADD CONSTRAINT `FK_tblDetalleVenta_idArticulo` FOREIGN KEY (`idArticulo`) REFERENCES `tblarticulo` (`idArticulo`),
ADD CONSTRAINT `FK_tblDetalleVenta_idVenta` FOREIGN KEY (`idVenta`) REFERENCES `tblventa` (`idVenta`);

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
ADD CONSTRAINT `fk_tblmatricula_tblficha1` FOREIGN KEY (`idFicha`) REFERENCES `tblficha` (`idFicha`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tblmatricula_tblventa1` FOREIGN KEY (`idVenta`) REFERENCES `tblventa` (`idVenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
ADD CONSTRAINT `fk_tblsubsidio_tblcliente1` FOREIGN KEY (`tblcliente_tipoDocumento`, `tblcliente_numeroDocumento`) REFERENCES `tblcliente` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tblsubsidio_tblempresa1` FOREIGN KEY (`tblempresa_nitEmpresa`) REFERENCES `tblempresa` (`nitEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
ADD CONSTRAINT `tblusuario_ibfk_1` FOREIGN KEY (`idrol`) REFERENCES `tblrol` (`idrol`);

--
-- Filtros para la tabla `tblventa`
--
ALTER TABLE `tblventa`
ADD CONSTRAINT `fk_tblventa_tblcliente1` FOREIGN KEY (`tblcliente_tipoDocumento`, `tblcliente_numeroDocumento`) REFERENCES `tblcliente` (`tipoDocumento`, `numeroDocumento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tblventa_tblfactura1` FOREIGN KEY (`tblfactura_idFactura`) REFERENCES `tblfactura` (`idFactura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tblventa_tblusuario1` FOREIGN KEY (`tblusuario_idUsuario`) REFERENCES `tblusuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
