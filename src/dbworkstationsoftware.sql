-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-09-2015 a las 07:57:10
-- Versión del servidor: 5.6.21
-- Versión de PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarArticulo`(
        in idArticu		int,
	in idCategoriaArticu	int,
	in descripcionArticu	varchar(50),
        in precioVen            int
)
BEGIN
    declare precioCompra int;
    set precioCompra = (select precioCompra from tblarticulo where idArticulo = idArticu);
    IF(precioCompra>precioVen) THEN
        SELECT -1;
    ELSE
	UPDATE tblarticulo SET 
            `idCategoriaArticulo` = `idCategoriaArticu`, 
            `descripcionArticulo`=`descripcionArticu`,
            `precioVenta`=`precioVen`
        WHERE `idArticulo`=`idArticu`;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCategoriaArticulo`(
        in idCategoriaArticu        int,
	in nombreCategoriaArticu    varchar(50)
)
BEGIN
	UPDATE tblcategoriaarticulo SET 
            `nombreCategoriaArticulo`=`nombreCategoriaArticu`
        WHERE `idCategoriaArticulo`=`idCategoriaArticu`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCategoriaCurso`(
        in idCategoria int,
        in nombreCategoria varchar(30)
)
BEGIN
	UPDATE tblcategoriacurso SET 
            `nombreCategoriaCurso`=`nombreCategoria`
	WHERE `idCategoriaCurso`=`idCategoria`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarClase`(
    IN `documentoUsuar` VARCHAR(30),
    IN `idCur` INT,
    IN `estadoPa` INT,
    IN `creditoCrea` INT
)
BEGIN
    declare idClas int;
    set idClas = (select min(`idClase`) FROM tblclase WHERE `documentoUsuario`= `documentoUsuar` and `idCurso`=`idCur` and `estadoAsistencia`=0);    
    UPDATE tblclase
        SET fecha = now(),
            `estadoPago`= `estadoPa`,
            `estadoAsistencia`=1,
            `creditoCreado`=`creditoCrea`
    WHERE `idClase` = idClas;
    select 'Asistencia registrada correctamente' as mensaje, 'success' as tipo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCredito`(
    in idCredi          int,
    in saldoActu      int
)
BEGIN
        declare msg varchar(100);
    	if (saldoActu < 0 ) then
		set msg=convert('No se puede realizar la transacción. El saldo está debajo de lo permitido.' using utf8);
		select msg as Respuesta, 'error' as tipo;
       	else
            UPDATE tblcredito 
            SET `saldoActual` = `saldoActu` 
            WHERE `idCredito` = `idCredi`;
            set msg=convert('El crédito se ha actualizado correctamente.' using utf8);	
            select msg as Respuesta, 'success' as tipo; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarCurso`(
        in idCur            int,
	in nombreCur        varchar(50),
	in cantidadClas     int,
	in horasPorCla      int,
	in estadoCur        int,
        in descripcionCur   varchar(100),
        in precioCur        int,
        in idCategoriaCur   int
)
BEGIN
	UPDATE tblcurso SET 
            `nombreCurso`=`nombreCur`,
            `cantidadClases`=`cantidadClas`,
            `horasPorClase`=`horasPorCla`,
            `estadoCurso` = `estadoCur`,
            `descripcionCurso`=`descripcionCur`,
            `precioCurso`=`precioCur`,
            `idCategoriaCurso` = `idCategoriaCur`
        WHERE `idCurso`=`idCur`;       
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEmpresa`(
        in nitEmpre         int,
	in nombreEmpre      varchar(50),
	in direccionEmpre   varchar(50),
	in nombreContac     varchar(50),
	in telefonoContac   varchar(50),
	in emailContac      varchar(50)
)
BEGIN
	UPDATE tblempresa SET
            `nombreEmpresa`=`nombreEmpre`,
            `direccionEmpresa`=`direccionEmpre`,
            `nombreContacto`=`nombreContac`,
            `telefonoContacto`=`telefonoContac`,
            `emailContacto`=`emailContac`
	WHERE `nitEmpresa`=`nitEmpre`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstadoCredito`(
    in idCredi          int,
    in estadoCredi      int
)
BEGIN
    UPDATE tblcredito 
    SET estadoCredito = estadoCredi 
    WHERE idCredito = idCredi;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstadoCurso`(
    in idCur        int,
    in estadoCur    int
)
BEGIN
	UPDATE tblcurso SET 
            `estadoCurso`=`estadoCur` 
        WHERE `idCurso`=`idCur`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstadoUsuario`(
    in documentoUsuar        varchar(20),
    in estadoUsuar int
)
BEGIN
	UPDATE tblusuario SET 
            `estadoUsuario`=`estadoUsuar` 
        WHERE `documentoUsuario`=`documentoUsuar`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarEstudiante`(
    in documentoUsuar   varchar(20),
    in fechaNacimien    DATE,
    in nombreUsuar      varchar(30),
    in apellidoUsuar    varchar(30),
    in emailUsuar       varchar(50),
    in passwo           varchar(45),
    in estadoUsuar      int,
    in documentoAcudien varchar(20),
    in direccionUsuar   varchar(50),
    in telefonoFi       varchar(11),
    in telefonoMov      varchar(15),
    in generoUsuar      bit
)
BEGIN
    UPDATE tblusuario SET
        `fechaNacimiento`=`fechaNacimien`,
        `nombreUsuario`=`nombreUsuar`,
        `apellidoUsuario`=`apellidoUsuar`,
        `telefonoFijo`=`telefonoFi`,
        `emailUsuario`=`emailUsuar`,
        password=passwo,
        `estadoUsuario`=`estadoUsuar`,
        `documentoAcudiente`=`documentoAcudien`
    WHERE `documentoUsuario`=`documentoUsuar`;

    UPDATE tbldetalleusuario SET 
        `direccionUsuario` = `direccionUsuar`,
        `telefonoMovil`=`telefonoMov`,
        `generoUsuario`=`generoUsuar`
    WHERE `idDetalleUsuario` = (SELECT `idDetalleUsuario` FROM tblusuario WHERE `documentoUsuario`=`documentoUsuar`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarSeminario`(
        in idCur            int,
	in nombreCur        varchar(50),
	in cantidadClas     int,
	in horasPorCla      int,
	in estadoCur        int,
        in descripcionCur   varchar(100),
        in precioCur        int,
        in fechaSemina      varchar (50),
        in cupoSemina       int,
        in idCategoriaCur   int
)
BEGIN
	UPDATE tblcurso SET 
            `nombreCurso`=`nombreCur`,
            `cantidadClases`=`cantidadClas`,
            `horasPorClase`=`horasPorCla`,
            `estadoCurso` = `estadoCur`,
            `descripcionCurso`=`descripcionCur`,
            `precioCurso`=`precioCur`,
             fechaSeminario= fechaSemina,
             cupoSeminario = cupoSemina,
            `idCategoriaCurso` = `idCategoriaCur`
        WHERE `idCurso`=`idCur`;       
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarUsuario`(
    in documentoUsuar   varchar(20),
    in fechaNacimien    DATE,
    in nombreUsuar      varchar(30),
    in apellidoUsuar    varchar(30),
    in telefonoFi       varchar(20),
    in emailUsuar       varchar(50),
    in passwo           varchar(45),
    in estadoUsuar      int,
    in idro             int
)
BEGIN
    UPDATE tblusuario SET
        `fechaNacimiento`=`fechaNacimien`,
        `nombreUsuario`=`nombreUsuar`,
        `apellidoUsuario`=`apellidoUsuar`,
        `telefonoFijo`=`telefonoFi`,
        `emailUsuario`=`emailUsuar`,
        password=passwo,
        `estadoUsuario`=`estadoUsuar`
    WHERE `documentoUsuario`=`documentoUsuar`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spActualizarVenta`(
    IN `idArticu` INT, 
    IN `documentoClien ` varchar (20),
    IN `nombreClien` varchar (50),
    IN `fechaVen` varchar (20),
    IN `totalVen` INT
)
BEGIN
	UPDATE tblventa SET 
            `documentoCliente`=`documentoClien`,
            `nombreCliente`=`nombreClien`,
            `fechaVenta` = `fechaVen`,
            `totalVenta`=`totalVen`
        WHERE `idVenta`=`idVen`;       
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarAbonoByCredito`(IN `idCredi`     int)
select (a.idAbono, a.idCredito, a.valorAbono, a.fechaPago) from tblAbono a inner join tblCredito c on(a.idCredito=c.idCredito) 
where a.idCredito like concat('%',idCredi,'%') 
order by (a.idCredito,a.FechaPago)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarArticuloPorID`(id int)
BEGIN
    SELECT 
        `idArticulo`,
        `idCategoriaArticulo`, 
        `descripcionArticulo`, 
        `cantidadDisponible`, 
        `precioCompra`, 
        `precioVenta` 
    FROM `tblarticulo` 
    WHERE `idArticulo` = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarAsistentesSeminario`(in idseminar int)
BEGIN
    SELECT `idinscrito`,
            `documento`, 
            `nombres`, 
            `telefono`, 
            `correo` 
            FROM `tblinscrito` WHERE `idseminario` = idseminar;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCategoriaCursos`()
BEGIN
    SELECT 
        `idCategoriaCurso`,
        `nombreCategoriaCurso` 
    FROM `tblcategoriacurso` 
    WHERE `nombreCategoriaCurso`!='Seminario';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarClientesYEstudiantes`()
BEGIN
    SELECT 
        `documentoUsuario`, 
        DATE_FORMAT(`fechaNacimiento`,'%d/%m/%Y') as `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`, 
        du.`idDetalleUsuario` as `idDetalleUsuario`, 
        `direccionUsuario`, 
        `telefonoFijo`, 
        `telefonoMovil`, 
        `generoUsuario`, 
        `idrol`, 
        `documentoAcudiente`,
        `estadoBeneficiario`
    FROM `tblusuario` u inner join `tbldetalleusuario` du on (u.`idDetalleUsuario`= du.`idDetalleUsuario`)
    WHERE idrol in (3,4);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCompraPorID`(IN idCompra int)
BEGIN
    SELECT  
        `idMovimiento`, 
        `fechaMovimiento` as fechaCompra, 
        `totalMovimiento` as totalCompra, 
        `idtipoMovimiento`, 
        `documentoUsuario`, 
        `numeroAuxiliar` as `facturaProveedor`, 
        `nombreAuxiliar` as `nombreProveedor` 
    FROM `tblmovimiento` 
    WHERE `idtipoMovimiento` = 1
    AND `idMovimiento` = idCompra;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCompras`()
BEGIN
    SELECT  
        `idMovimiento`, 
        `fechaMovimiento` as fechaCompra, 
        `totalMovimiento` as totalCompra, 
        `idtipoMovimiento`, 
        `documentoUsuario`, 
        `numeroAuxiliar` as `facturaProveedor`, 
        `nombreAuxiliar` as `nombreProveedor` 
    FROM `tblmovimiento` 
    WHERE `idtipoMovimiento` = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCreditoByDocumento`(
    in documentoUsuar varchar(20)
)
BEGIN
    declare msg varchar(100);    
    if ((select idCredito from tblcredito where documentoUsuario=documentoUsuar) is not null) then        
        select c.idCredito, c.documentoUsuario, c.saldoInicial, c.saldoActual, c.estadoCredito,c.`fechaInicio`, 'success' as tipo
        FROM tblCredito c inner join tblusuario u on c.documentoUsuario = u.documentoUsuario
        WHERE c.documentoUsuario = documentoUsuar;
    else
        set msg=convert('No existe el crédito' using utf8);
        select msg as Respuesta, 'error' as tipo; 
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCreditoByID`(
    in idCredi int
)
BEGIN
    declare msg varchar(100);    
    if ((select documentoUsuario from tblcredito where idCredito=idCredi) is not null) then        
        SELECT idCredito, documentoUsuario, fechaInicio, saldoInicial, saldoActual, estadoCredito, 'success' as tipo
        FROM tblcredito 
        WHERE idCredito=idCredi;
    else
        set msg=convert('No existe el crédito' using utf8);
        select msg as Respuesta, 'error' as tipo; 
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCursoPorID`(id int)
BEGIN
    SELECT 
        `idCurso`,
        `nombreCurso`, 
        `cantidadClases`, 
        `horasPorClase`, 
        `estadoCurso`, 
        `descripcionCurso`, 
        `precioCurso`, 
        cc.`idCategoriaCurso` as `idCategoriaCurso`,
        cc.`nombreCategoriaCurso` as `nombreCategoriaCurso`
    FROM `tblcurso` c INNER JOIN tblcategoriacurso cc ON (c.`idCategoriaCurso`=cc.`idCategoriaCurso`) 
    WHERE `idCurso`=id AND `nombreCategoriaCurso`!='Seminario';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCursos`()
BEGIN
    SELECT 
        `idCurso`,
        `nombreCurso`, 
        `cantidadClases`, 
        `horasPorClase`, 
        `estadoCurso`, 
        `descripcionCurso`, 
        `precioCurso`, 
        cc.`idCategoriaCurso` as `idCategoriaCurso`,
        cc.`nombreCategoriaCurso` as `nombreCategoriaCurso`
    FROM `tblcurso` c INNER JOIN tblcategoriacurso cc ON (c.`idCategoriaCurso`=cc.`idCategoriaCurso`) 
    WHERE `nombreCategoriaCurso`!='Seminario';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCursosDisponibles`()
BEGIN
    SELECT 
        `idCurso`,
        `nombreCurso`, 
        `cantidadClases`, 
        `horasPorClase`, 
        `estadoCurso`, 
        `descripcionCurso`, 
        `precioCurso`, 
        cc.`idCategoriaCurso` as `idCategoriaCurso`,
        cc.`nombreCategoriaCurso` as `nombreCategoriaCurso`
    FROM `tblcurso` c INNER JOIN tblcategoriacurso cc ON (c.`idCategoriaCurso`=cc.`idCategoriaCurso`) 
    WHERE `nombreCategoriaCurso`!='Seminario' and `estadoCurso`=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarDetalleCreditoByIdCredito`(
    in idCredi int
)
BEGIN
    SELECT d.idMovimiento as "Movimiento", m.`fechaMovimiento` as "Fecha", CONCAT(ar.`descripcionArticulo`,' x ',dm.cantidad) as "Descripción",`totalDetalleMovimiento` as "Debe/Cargo", 0 as "Haber/Abono", `saldoActual` as "Saldo"
    FROM tblmovimiento m inner join tbldetallemovimiento dm on (m.`idMovimiento` = dm.`idMovimiento`) inner join tbldetallecredito d on (m.`idMovimiento`=d.`idMovimiento`) inner join tblcredito c on (d.idCredito = c.idCredito) inner join tblarticulo ar on(dm.`idArticulo`=ar.`idArticulo`)
    WHERE d.idCredito = idCredi;
    SELECT d.idMovimiento as "Movimiento", m.`fechaMovimiento` as "Fecha", CONCAT('Clases ' , cur.`nombreCurso`,' x ', dm.cantidad) as "Descripción",`totalDetalleMovimiento` as "Debe/Cargo", 0 as "Haber/Abono", `saldoActual` as "Saldo"
    FROM tblmovimiento m inner join tbldetallemovimiento dm on (m.`idMovimiento` = dm.`idMovimiento`) inner join tbldetallecredito d on (m.`idMovimiento`=d.`idMovimiento`) inner join tblcredito c on (d.idCredito = c.idCredito) inner join tblclase cl on (cl.`idClase`=dm.`idClase`) inner join tblcurso cur on(cur.`idCurso` = cl.`idCurso`)
    WHERE d.idCredito = idCredi;
    SELECT `idMovimiento` as "Movimiento", m.`fechaMovimiento` as "Fecha", 'Abono' as "Descripción",0 as "Debe/Cargo", `totalMovimiento` as "Haber/Abono", `saldoActual` as "Saldo" from tblcredito c inner join tblmovimiento m on(c.`idCredito`=m.`numeroAuxiliar`) inner join tbltipomovimiento tp on(m.`idtipoMovimiento` = tp.`idtipoMovimiento`) where m.`idtipoMovimiento` = 5 and `numeroAuxiliar` = `idCredi`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarDetallesCompraPorID`(IN idCompra int)
BEGIN
    SELECT 
        `idDetalleMovimiento`, 
        art.`idArticulo` as `idArticulo`, 
        `descripcionArticulo`,
        `cantidad`, 
        `descuento`, 
        `totalDetalleMovimiento`, 
        `idMovimiento`, 
        `precioArticulo` 
    FROM `tbldetallemovimiento` detMov INNER JOIN tblarticulo art
    ON (detMov.`idArticulo`=art.`idArticulo`)
    WHERE `idMovimiento` = idCompra;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarDetallesVentaPorID`(IN idVenta int)
BEGIN
    SELECT 
        `idDetalleMovimiento`, 
        art.`idArticulo` as `idArticulo`, 
        `descripcionArticulo`,
        `cantidad`, 
        `descuento`, 
        `totalDetalleMovimiento`, 
        `idMovimiento`, 
        `precioArticulo` 
    FROM `tbldetallemovimiento` detMov INNER JOIN tblarticulo art
    ON (detMov.`idArticulo`=art.`idArticulo`)
    WHERE `idMovimiento` = idVenta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEstudiantePorID`(
    in id varchar(30)
)
BEGIN
    SELECT 
        `documentoUsuario`, 
        DATE_FORMAT(`fechaNacimiento`,'%d/%m/%Y') as `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`, 
        du.`idDetalleUsuario` as `idDetalleUsuario`, 
        `direccionUsuario`, 
        `telefonoFijo`, 
        `telefonoMovil`, 
        `generoUsuario`, 
        `idrol`, 
        `documentoAcudiente`,
        (SELECT `nombreAcudiente` FROM tblacudiente WHERE `documentoAcudiente` = u.`documentoAcudiente`) as nombreAcudiente,
        `estadoBeneficiario`
    FROM `tblusuario` u inner join `tbldetalleusuario` du on (u.`idDetalleUsuario`= du.`idDetalleUsuario`)
    WHERE idrol=3 and u.`documentoUsuario`=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEstudiantes`()
BEGIN
    SELECT 
        `documentoUsuario`, 
        DATE_FORMAT(`fechaNacimiento`,'%d/%m/%Y') as `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`, 
        du.`idDetalleUsuario` as `idDetalleUsuario`, 
        `direccionUsuario`, 
        `telefonoFijo`, 
        `telefonoMovil`, 
        `generoUsuario`, 
        `idrol`, 
        `documentoAcudiente` 
    FROM `tblusuario` u inner join `tbldetalleusuario` du on (u.`idDetalleUsuario`= du.`idDetalleUsuario`)
    WHERE idrol=3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEstudiantesConClasesActivas`()
BEGIN
    SELECT 
        usu.`documentoUsuario` as `documentoUsuario`, 
        `nombreCurso`,  
        (select count(`idClase`) from tblclase where `documentoUsuario` = usu.`documentoUsuario` and `idCurso`=cu.`idCurso`) as numeroClases,
        (select count(`idClase`) from tblclase where `documentoUsuario` = usu.`documentoUsuario` and `idCurso`=cu.`idCurso` and `estadoAsistencia`=0) as numeroClasesFaltantes,
        (select count(`idClase`) from tblclase where `documentoUsuario` = usu.`documentoUsuario` and `idCurso`=cu.`idCurso` and `estadoAsistencia`=1) as numeroClasesAsistidas,       
        (select max(fecha) from tblclase where `documentoUsuario` = usu.`documentoUsuario` and `idCurso`=cu.`idCurso` and `estadoAsistencia`=1) as fechaUltimaAsistencia,
        cu.`idCurso` as idCurso
    FROM `tblclase` cl 
        inner join `tblcurso` cu 
        on(cl.`idCurso` = cu.`idCurso`)
        inner join tblusuario usu 
        on (cl.`documentoUsuario`=usu.`documentoUsuario`)
    GROUP BY usu.`documentoUsuario`, cl.`idCurso`;
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarEstudiantesConClasesSinPagar`()
BEGIN
    SELECT 
        DISTINCT  usu.`documentoUsuario` as `documentoUsuario`, 
        `nombreCurso`,  
        (select count(`idClase`) from tblclase where `documentoUsuario` = usu.`documentoUsuario` and `idCurso`=cu.`idCurso` and cl.`estadoAsistencia`=1 and cl.`estadoPago`=0) as numeroClases
    FROM `tblclase` cl 
        inner join `tblcurso` cu 
        on(cl.`idCurso` = cu.`idCurso`)
        inner join tblusuario usu 
        on (cl.`documentoUsuario`=usu.`documentoUsuario`)
    WHERE numeroClases>0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarIDCategoriaSeminario`()
BEGIN
    SELECT 
        `idCategoriaCurso`
    FROM `tblcategoriacurso` 
    WHERE `nombreCategoriaCurso`='Seminario';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarMatriculaPorDocumentoYIdCurso`(
    IN documentoUsuar VARCHAR(20),
    IN idCur int
)
BEGIN
    SELECT 
        usu.`documentoUsuario` as `documentoUsuario`,
        `nombreUsuario`,
        `apellidoUsuario`,
        cu.`idCurso` as `idCurso`,
        `nombreCurso`,
        `precioCurso`,
        `precioClase`,
        `horasPorClase`
    FROM `tblclase` cl 
        inner join `tblcurso` cu 
        on(cl.`idCurso` = cu.`idCurso`)
        inner join tblusuario usu 
        on (cl.`documentoUsuario`=usu.`documentoUsuario`)
    WHERE usu.`documentoUsuario`=`documentoUsuar` AND cu.`idCurso` = `idCur`
    GROUP BY usu.`documentoUsuario`, cl.`idCurso`;   
    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarOperarios`()
BEGIN
    SELECT 
        `documentoUsuario`, 
        DATE_FORMAT(`fechaNacimiento`,'%d/%m/%Y') as `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        telefonoFijo,
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`, 
        `idrol`        
    FROM `tblusuario`
    WHERE idrol = 2;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarPreinscritoPorID`(IN id VARCHAR(30))
BEGIN
    SELECT        
        usu.`documentoUsuario` as `documentoUsuario`, 
        (select `nombreCurso` from tblcurso WHERE pre.`idCurso` = tblcurso.`idCurso`) as nombreCurso,
        (select if(`idCategoriaCurso`<2, 'Seminario','Curso') from tblcurso WHERE pre.`idCurso` = tblcurso.`idCurso`) as tipo,
        fecha as fechaPreincripcion, 
        DATE_FORMAT(`fechaNacimiento`,'%d/%m/%Y') as `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`, 
        `idrol`
    FROM `tblusuario` usu
    inner join tblpreinscripcion pre on(usu.`documentoUsuario`=pre.`documentoUsuario`)
    WHERE idrol=4 and estado=1 and usu.`documentoUsuario`=id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarPreinscritos`()
BEGIN
    SELECT        
        usu.`documentoUsuario` as `documentoUsuario`, 
        (select `nombreCurso` from tblcurso WHERE pre.`idCurso` = tblcurso.`idCurso`) as nombreCurso,
        `idCurso`,
        fecha as fechaPreincripcion, 
        DATE_FORMAT(`fechaNacimiento`,'%d/%m/%Y') as `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`, 
        `idrol`
    FROM `tblusuario` usu
    inner join tblpreinscripcion pre on(usu.`documentoUsuario`=pre.`documentoUsuario`)
    WHERE idrol=4 and estado=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarSeminarioPorID`(id int)
BEGIN
    SELECT 
        `idCurso`,
        `nombreCurso`, 
        `cantidadClases`, 
        `horasPorClase`, 
        `estadoCurso`, 
        `descripcionCurso`, 
        `precioCurso`, 
         DATE_FORMAT(fechaSeminario, '%d/%m/%Y %H:%i:%s') as fechaSeminario,
         cupoSeminario,
        cc.`idCategoriaCurso` as `idCategoriaCurso`,
        cc.`nombreCategoriaCurso` as `nombreCategoriaCurso`
    FROM `tblcurso` c INNER JOIN tblcategoriacurso cc ON (c.`idCategoriaCurso`=cc.`idCategoriaCurso`) 
    WHERE `idCurso`=id AND `nombreCategoriaCurso`='Seminario';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarSeminarios`()
BEGIN
    SELECT 
        `idCurso`,
        `nombreCurso`, 
        `cantidadClases`, 
        `horasPorClase`, 
        `estadoCurso`, 
        `descripcionCurso`, 
        `precioCurso`, 
        cc.`idCategoriaCurso` as `idCategoriaCurso`,
        cc.`nombreCategoriaCurso` as `nombreCategoriaCurso`
    FROM `tblcurso` c INNER JOIN tblcategoriacurso cc ON (c.`idCategoriaCurso`=cc.`idCategoriaCurso`) 
    WHERE `nombreCategoriaCurso`='Seminario';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarSeminariosDisponibles`()
BEGIN
    SELECT 
        `idCurso`,
        `nombreCurso`, 
        `cantidadClases`, 
        `horasPorClase`, 
        `estadoCurso`, 
        `descripcionCurso`, 
        `precioCurso`, 
        cc.`idCategoriaCurso` as `idCategoriaCurso`,
        cc.`nombreCategoriaCurso` as `nombreCategoriaCurso`
    FROM `tblcurso` c INNER JOIN tblcategoriacurso cc ON (c.`idCategoriaCurso`=cc.`idCategoriaCurso`) 
    WHERE `nombreCategoriaCurso`='Seminario' and `estadoCurso`=1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarSubsidiosEmpresa`(

	in idEmpre	int

)
BEGIN
	select idSubsidio, fechaAsignacion, valorSubsidio, nitEmpresa, documentoUsuario from tblsubsidio
	where nitEmpresa = idEmpre
	order by idSubsidio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarUsuarioModulo`(
    IN `idUser` varchar (30)
)
BEGIN
    SELECT 
        tblusuario.`emailUsuario` "id",
        tblmodulo.enlace "enlace",
        tblmodulo.nombre "nombre" 
    FROM tblusuario inner join tblrol on (tblusuario.idrol = tblrol.idrol) inner join tblmodulorol on(tblrol.idrol=tblmodulorol.idrol) inner join tblmodulo on(tblmodulorol.idmodulo=tblmodulo.idmodulo) where tblusuario.`emailUsuario`=idUser;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarUsuarioPorID`(
    in `documentoUsuar` varchar(40)
 )
BEGIN
    SELECT 
        `documentoUsuario`,
        `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        `telefonoFijo`,
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`,
        `idDetalleUsuario`, 
        `idrol`, 
        `documentoAcudiente` 
    FROM `tblusuario` 
    WHERE `documentoUsuario` = `documentoUsuar`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarUsuarioPorPassYCorreo`(
    in `correo` varchar(40),
    in `pass` varchar(40)
)
BEGIN
    SELECT 
        `documentoUsuario`, 
        `fechaNacimiento`, 
        `nombreUsuario`, 
        `apellidoUsuario`, 
        `emailUsuario`, 
        `password`, 
        `estadoUsuario`, 
        `idDetalleUsuario`, 
        `idrol`, 
        `documentoAcudiente` 
    FROM `tblusuario`  
    WHERE `emailUsuario` = `correo` and `password` = `pass`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarVentaPorID`(
    in idVenta int
)
BEGIN
    SELECT  
        `idMovimiento`, 
        `fechaMovimiento` as fechaVenta, 
        `totalMovimiento` as totalVenta, 
        `idtipoMovimiento`, 
        `documentoUsuario`, 
        `numeroAuxiliar` as `numeroVenta`, 
        `nombreAuxiliar` as `nombreCliente`, 
        `documentoAuxiliar` as `documentoCliente`
    FROM `tblmovimiento` 
    WHERE `idtipoMovimiento` = 3
    AND `idMovimiento` = idVenta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarVentas`()
BEGIN
    SELECT  
        `idMovimiento`, 
        `fechaMovimiento` as fechaVenta, 
        `totalMovimiento` as totalVenta, 
        `idtipoMovimiento`, 
        `documentoUsuario`, 
        `numeroAuxiliar` as `numeroVenta`, 
        `nombreAuxiliar` as `nombreCliente`, 
        `documentoAuxiliar` as `documentoCliente`
    FROM `tblmovimiento` 
    WHERE `idtipoMovimiento` = 3;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarVentasDiarias`(

)
BEGIN
	select * from tblVenta
	where fechaVenta = CURDATE();
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spContadorArticulo`()
BEGIN
    declare respuesta int;
    set respuesta = (SELECT max(`idArticulo`)+1 FROM `tblarticulo`);
    IF (respuesta is not null) THEN
        SELECT respuesta as idArticulo;
    ELSE
        SELECT 1 as idArticulo;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spContadorClase`()
BEGIN
    declare respuesta int;
    set respuesta = (SELECT max(idClase)+1 FROM `tblclase` WHERE `tblcurso_idCurso` = idCurso);
    IF (respuesta is not null) THEN
        SELECT respuesta as idClase;
    ELSE
        SELECT 1 as idClase;
    END IF;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spContadorVenta`()
BEGIN
    declare respuesta int;
    set respuesta = (SELECT max(`numeroAuxiliar`)+1 FROM `tblmovimiento` WHERE `idtipoMovimiento` = 3);
    IF (respuesta is not null) THEN
        SELECT respuesta as idVenta;
    ELSE
        SELECT 1 as idVenta;
    END IF;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spContarClasesRestantes`(
    IN `idCur` INT,
    IN `documentoUsuar` VARCHAR(30),
    IN `cantidadClas` INT
)
BEGIN
    IF ((select distinct idCurso from tblclase where `documentoUsuario`=`documentoUsuar`) is null) then
        select (`cantidadClases`-`cantidadClas`) as "Restantes"  from tblcurso where idCurso = `idCur`;
    else
    SELECT `cantidadClases`-(`cantidadClas`+ count(`idClase`)) as "Restantes" FROM tblcurso cur inner join tblclase cl on(cur.`idCurso` =cl.`idCurso`) where cur.`idCurso` = `idCur` and `documentoUsuario` = `documentoUsuar` group by `documentoUsuario`;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spGenerarVentaClases`(
    in cantidadClases int,
    IN `documentoUsuar` VARCHAR(30),
    IN `documentoClien` VARCHAR(30),
    IN `idCur` INT
)
BEGIN
    declare idVen int;    
    declare totalVen int;
    declare nombreClien varchar (60);
    declare msg varchar(40);    
    set idVen = (SELECT max(`numeroAuxiliar`)+1 FROM `tblmovimiento` WHERE `idtipoMovimiento` = 3);   
    IF (idVen is  null) THEN
        set idVen=1;
    END IF;    
    set totalVen= cantidadClases*(select distinct `precioClase` FROM tblclase WHERE `documentoUsuario`= `documentoClien` and `idCurso`=`idCur`);
    set nombreClien = (select convert(concat(`nombreUsuario`, ' ', `apellidoUsuario`) using utf8) from tblusuario WHERE `documentoUsuario` = `documentoClien`);        
	if (exists(select numeroAuxiliar from tblmovimiento where numeroAuxiliar=`idVen` and `idtipoMovimiento`=3)) then
		set msg="Esta venta ya existe";
		select msg as Respuesta;
	else
            insert into tblmovimiento 
            (
                `fechaMovimiento`, 
                `totalMovimiento`, 
                `idtipoMovimiento`, 
                `documentoUsuario`, 
                `nombreAuxiliar`,
                `numeroAuxiliar`,
                documentoAuxiliar
            ) VALUES (
                NOW(),
                totalVen,
                3,
                documentoUsuar,
                nombreClien,
                idVen,
                documentoClien
            );
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarAbono`(
    in idCredi          int,
    in total             int,
    in documentoUsuar       VARCHAR(30) ,    
    in documentoClien       VARCHAR(45)
)
BEGIN
        declare msg varchar(100);
        declare nombreClien VARCHAR(50);       
        declare saldoActu int;        
        set saldoActu =  (SELECT `saldoActual` FROM tblcredito WHERE `idCredito` = `idCredi`) + total;
        set nombreClien = (SELECT concat(`nombreUsuario`, ' ', `apellidoUsuario`) FROM tblusuario where `documentoUsuario` = `documentoClien`);
    	if (saldoActu > 50000 ) then
		set msg=convert('No se puede realizar la transacci������n. El saldo est������ encima de lo permitido.' using utf8);
		select msg as Respuesta, 'error' as tipo;
       	else
            UPDATE tblcredito 
            SET `saldoActual` = `saldoActu` 
            WHERE `idCredito` = `idCredi`;
            insert into tblmovimiento 
            (
                `fechaMovimiento`, 
                `totalMovimiento`, 
                `idtipoMovimiento`, 
                `documentoUsuario`, 
                `nombreAuxiliar`,
                `numeroAuxiliar`,
                documentoAuxiliar
            ) VALUES (
                NOW(),
                `total`,
                5,
                documentoUsuar,
                `nombreClien`,
                `idCredi`,
                documentoClien
            );
            set msg=convert('Se ha registrado el abono correctamente.' using utf8);	
            select msg as Respuesta, 'success' as tipo; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarAcudiente`(
    in `documentoAcudien` varchar (20), 
    in `nombreAcudien` varchar (50), 
    in `telefonoAcudien` varchar(20), 
    in `fechaNacimien` date,
    in `documentoEstudian` varchar(20)

 )
BEGIN
    INSERT INTO `tblacudiente`
        (
            `documentoAcudiente`, 
            `nombreAcudiente`, 
            `telefonoAcudiente`, 
            `fechaNacimiento`
        ) VALUES 
        (
            `documentoAcudien`, 
            `nombreAcudien`, 
            `telefonoAcudien`, 
            `fechaNacimien`
        );
    UPDATE tblusuario SET `documentoAcudiente` = `documentoAcudien` WHERE `documentoUsuario` = `documentoEstudian`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarArticulo`(
    IN `idCategoriaArticu` int, 
    IN `descripcionArticu` varchar(50), 
    IN `precioComp` int, 
    IN `precioVen` int
)
BEGIN    
    IF (precioComp> precioVen) THEN 
        SELECT CONVERT("El precio de compra no puede ser mayor al de venta." using utf8) as msg, "error" as tipo;
    ELSEIF ((SELECT idarticulo FROM tblarticulo WHERE LOWER(`descripcionArticulo`) = LOWER(`descripcionArticu`))IS NOT NULL) THEN
        SELECT CONVERT("Ya existe un artículo con ese nombre." using utf8) as msg, "error" as tipo;
    ELSE
        INSERT INTO `tblarticulo`(
            `idCategoriaArticulo`, 
            `descripcionArticulo`, 
            `cantidadDisponible`,   
            `precioCompra`, 
            `precioVenta`
        ) 
        VALUES (
            `idCategoriaArticu`, 
            `descripcionArticu`, 
             0,   
            `precioComp`, 
            `precioVen`
        );
    SELECT CONVERT("El artículo ha sido registrado" using utf8) as msg, "success" as tipo;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarBeneficio`( in `valorSubsid` int, `nitEmpre` varchar(20), in `documentoUsuar` varchar(20))
BEGIN
	declare msg varchar(40);    
	if (exists(select idSubsidio from tblsubsidio where documentoUsuario=documentoUsuar and nitEmpresa=nitEmpre)) then
		set msg="Este subsidio ya existe";
		select msg as Respuesta;
	else
		insert into tblsubsidio ( `valorSubsidio`, `nitEmpresa`, `documentoUsuario`) Values( `valorSubsid`, `nitEmpre`, `documentoUsuar`);
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCategoriaArticulo`(IN `nombre` VARCHAR(30))
BEGIN
    declare msg varchar(100);
    if((select nombreCategoriaArticulo from tblcategoriaarticulo where lower(`nombreCategoriaArticulo`) = lower(nombre))is not null) then
        set msg = CONVERT('Ya existe una Categoría con ese nombre' using utf8);
        select msg as mensaje, 'error' as tipo;
    else
        insert into tblcategoriaarticulo (nombreCategoriaArticulo) values (nombre);
        set msg = CONVERT(CONCAT('La Categoría ', nombre, ' ha sido registrada') using utf8);
        select msg as mensaje, 'success' as tipo;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCategoriaCurso`(IN `nombre` VARCHAR(30))
BEGIN
    declare msg varchar(100);
    if((select nombreCategoriaCurso from tblcategoriacurso where  lower(`nombreCategoriaCurso`) = lower(nombre))is not null) then
        set msg = CONVERT('Ya existe una categoría con ese nombre' using utf8);
        select msg as mensaje, 'error' as tipo;
    else
        insert into tblcategoriacurso (nombreCategoriaCurso) values (nombre);
        set msg = CONVERT(CONCAT('La categoría ', nombre, ' ha sido registrada') using utf8);
        select msg as mensaje, 'success' as tipo;
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarClase`(
    IN `idCur` INT,
    IN `documentoUsuar` VARCHAR(30)
)
BEGIN

    declare msg varchar(100);    
    IF (exists(select `documentoUsuario` from tblclase WHERE `estadoPago` = 0  and `estadoAsistencia` = 1 and `documentoUsuario` = `documentoUsuar` and `idCurso` = `idCur`)) THEN
        set msg= CONVERT('Este estudiante cuenta con clases sin pagar de este curso' using utf8);
        select msg as mensaje, 'error' as tipo;
    ELSEIF(exists (select `documentoUsuario` from tblclase WHERE `estadoPago` = 0  and `documentoUsuario` = `documentoUsuar` and `idCurso` IN (SELECT `idCurso` from tblcurso where idCurso!=`idCur` and `idCategoriaCurso` = (SELECT `idCategoriaCurso` from tblcurso where `idCurso`= `idCur`)))) THEN
        set msg= CONVERT('Este estudiante cuenta con una matrícula activa de un curso de la misma categoria' using utf8);
        select msg as mensaje, 'error' as tipo;
    ELSEIF((select if(count(1)>1, 1, null) from (select distinct `idCurso` from tblclase WHERE `estadoAsistencia` = 0  and `documentoUsuario` = `documentoUsuar` and `idCurso`!=`idCur` GROUP by `idCurso`) as temp)is not null) THEN
        set msg= CONVERT('Este estudiante cuenta con dos matrículas activas' using utf8);        
        select msg as mensaje, 'error' as tipo;
    ELSE
        INSERT INTO tblclase
        (
            `idCurso`,
            `documentoUsuario`,
            `precioClase`
        ) VALUES 
        (
            idCur, 
            documentoUsuar,
            (SELECT `precioCurso`/`cantidadClases` FROM `tblcurso` WHERE `idCurso` = idCur)
        );
        set msg= CONVERT('Se ha registrado la matrícula' using utf8);
        select msg as mensaje, 'success' as tipo;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCompra`(
    IN `facturaProveed` VARCHAR(50), 
    IN `nombreProveed` VARCHAR(50), 
    IN `totalMovimien` INT,
    IN `documentoUsuar` VARCHAR(30)
)
BEGIN
    declare msg varchar(40);    
    if (exists(select numeroAuxiliar from tblmovimiento where numeroAuxiliar=`facturaProveed` and `idtipoMovimiento` = 1)) then
            set msg="Esta compra ya fue registrada.";
            select msg as Respuesta;
    else
        INSERT INTO `tblmovimiento`
        (
            `fechaMovimiento`, 
            `totalMovimiento`, 
            `idtipoMovimiento`, 
            `documentoUsuario`, 
            `numeroAuxiliar`, 
            `nombreAuxiliar`
        ) VALUES (
            NOW(),
            `totalMovimien`,
            1,
            `documentoUsuar`, 
            `facturaProveed`, 
            `nombreProveed`
        );
    end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCredito`(
    in documentoUsuar       varchar(20),
    in saldoInici   double,
    in saldoActu    double    
 )
BEGIN
        declare msg varchar(100);    
	if ((select idCredito from tblcredito where documentoUsuario=documentoUsuar) is not null) then
		set msg=convert('Ya existe un crédito' using utf8);
		select msg as Respuesta, 'error' as tipo;
       	else
		insert into tblcredito (documentoUsuario,saldoInicial,saldoActual) 
                values(documentoUsuar,saldoInici,saldoActu);
		set msg=convert('El crédito se ha registrado correctamente.' using utf8);
		select msg as Respuesta, 'success' as tipo; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarCurso`(
    in nombre varchar(30),
    in cantidad int,
    in horas int,
    in estado int,
    in descripcion varchar(100),
    in precio int,
    in idcategoria int
)
BEGIN
    IF ((SELECT idcurso FROM tblcurso WHERE LOWER(`nombreCurso`) = LOWER(`nombre`) AND idcategoria!=1)IS NOT NULL) THEN
        SELECT "Ya existe un curso con ese nombre." as msg, "error" as tipo;
    ELSE
        INSERT INTO `tblcurso`(
            `nombreCurso`, 
            `cantidadClases`, 
            `horasPorClase`, 
            `estadoCurso`, 
            `descripcionCurso`, 
            `precioCurso`,
            `idCategoriaCurso`
        ) VALUES (
            nombre,
            cantidad,
            horas,
            estado,
            descripcion,
            precio,
            idcategoria
        );
        SELECT "El curso ha sido registrado" as msg, "success" as tipo;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarDetalleCompra`(
    IN `idArticu` INT, 
    IN `cantid` INT, 
    IN `descuen` INT, 
    IN `totalDetalleMovimien` INT,
    IN `precioArticu` INT
)
BEGIN
    INSERT INTO `tbldetallemovimiento`
    (
        `idArticulo`, 
        `cantidad`, 
        `descuento`, 
        `totalDetalleMovimiento`, 
        `idMovimiento`, 
        `precioArticulo`
    ) VALUES 
    (
        `idArticu`, 
        `cantid`, 
        `descuen`, 
        `totalDetalleMovimien`,
        (SELECT MAX(`idMovimiento`) FROM tblmovimiento),
        `precioArticu`
    );
    UPDATE `tblarticulo` SET `cantidadDisponible`=`cantidadDisponible` + `cantid`,`precioCompra`= `precioArticu` WHERE `idArticulo` = `idArticu`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarDetalleCredito`()
BEGIN
	INSERT INTO tbldetallecredito (idCredito,idMovimiento) 
        VALUES((SELECT max(`idCredito`) from tblcredito),(SELECT max(`idMovimiento`) from tblmovimiento));
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarDetalleEstudiante`(
    in direccionUsuar   varchar(50),
    in telefonoMov      varchar(15),
    in generoUsuar      bit
)
BEGIN
    INSERT INTO `tbldetalleusuario`(
        `direccionUsuario`, 
        `telefonoMovil`, 
        `generoUsuario`
    ) VALUES (
        direccionUsuar,
        telefonoMov,
        generoUsuar
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarDetalleMovimientoCredito`(
in documentoUsuar varchar (30)
)
BEGIN
   declare idClas int;
   set idClas = (SELECT min(idClase) from tblclase where documentoUsuario = documentoUsuar and estadoPago=0 and estadoAsistencia=0 );
   INSERT INTO `tbldetallemovimiento`
   (
       `idClase`, 
       `cantidad`, 
       `descuento`, 
       `totalDetalleMovimiento`, 
       `idMovimiento`, 
       `precioArticulo`
   ) VALUES 
   (   
       idClas,
       1, 
       0, 
       (SELECT `precioClase` FROM tblclase WHERE `idClase` = `idClas`),
       (SELECT MAX(`idMovimiento`) FROM tblmovimiento),
       (SELECT `precioClase` FROM tblclase WHERE `idClase` = `idClas`)
   );    
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarDetalleVenta`(
    IN `idArticu` INT, 
    IN `cantid` INT, 
    IN `descuen` INT, 
    IN `totalDetalleMovimien` INT,
    IN `precioArticu` INT
)
BEGIN
    INSERT INTO `tbldetallemovimiento`
    (
        `idArticulo`, 
        `cantidad`, 
        `descuento`, 
        `totalDetalleMovimiento`, 
        `idMovimiento`, 
        `precioArticulo`
    ) VALUES 
    (
        `idArticu`, 
        `cantid`, 
        `descuen`, 
        `totalDetalleMovimien`,
        (SELECT MAX(`idMovimiento`) FROM tblmovimiento),
        `precioArticu`
    );
    UPDATE `tblarticulo` SET `cantidadDisponible`=`cantidadDisponible` - `cantid`,`precioVenta`= `precioArticu` WHERE `idArticulo` = `idArticu`;
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
	if (exists(select nitEmpresa from tblempresa where nitEmpresa=nitEmpre)) then
		set msg="Esta empresa ya existe";
		select msg as mensaje, 'success' as tipo;
	else
		insert into tblempresa (nitEmpresa,nombreEmpresa,direccionEmpresa,nombreContacto,telefonoContacto,emailContacto) Values(nitEmpre,nombreEmpre,direccionEmpre,nombreContac,telefonoContac,emailContac);
		set msg="La empresa se ha registrado exitosamente";		
		select msg as mensaje, 'error' as tipo; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarEstudiante`(
    in documentoUsuar   varchar(20),
    in fechaNacimien    DATE,
    in nombreUsuar      varchar(30),
    in apellidoUsuar    varchar(30),
    in telefonoFi       varchar(20),
    in emailUsuar       varchar(50),
    in passwo           varchar(45),
    in estadoUsuar      int,
    in documentoAcudien varchar(20)
)
BEGIN
INSERT INTO `tblusuario`(
    `documentoUsuario`, 
    `fechaNacimiento`, 
    `nombreUsuario`, 
    `apellidoUsuario`, 
    `telefonoFijo`, 
    `emailUsuario`, 
    `password`, 
    `estadoUsuario`, 
    `idrol`, 
    `documentoAcudiente`,
    `idDetalleUsuario`
) VALUES (
    documentoUsuar,
    fechaNacimien,
    nombreUsuar,
    apellidoUsuar,
    telefonoFi,
    emailUsuar,
    passwo,
    estadoUsuar,
    3,
    documentoAcudien,
    (SELECT MAX(idDetalleUsuario) FROM `tbldetalleusuario`));
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarEstudianteApartirDePreinscrito`(
    in documentoUsuar   varchar(20),
    in fechaNacimien    DATE,
    in nombreUsuar      varchar(30),
    in apellidoUsuar    varchar(30),
    in telefonoFi    varchar(20),
    in emailUsuar       varchar(50),
    in passwo           varchar(45),
    in estadoUsuar      int,
    in documentoAcudien varchar(20)
)
BEGIN
declare msg varchar(50);
IF (exists(SELECT `documentoUsuario` FROM `tblusuario` WHERE `documentoUsuario` = `documentoUsuar` and `idrol` = 3)) then
		set msg= CONVERT(CONCAT('Este cliente ya esta registrado como estudiante') using utf8);
		select msg as mensaje, 'error' as tipo;    
ELSE
    UPDATE tblusuario 
        SET `fechaNacimiento` = `fechaNacimien`,
            `nombreUsuario` = `nombreUsuar`,
            `apellidoUsuario` = `apellidoUsuar`,
            `telefonoFijo`=`telefonoFi`,
            `emailUsuario` = `emailUsuar`,
            password = passwo,
            `estadoUsuario` = `estadoUsuar`,
            idrol  = 3,
            `idDetalleUsuario` = (SELECT MAX(idDetalleUsuario) FROM `tbldetalleusuario`)
        WHERE `documentoUsuario` = `documentoUsuar`;
    UPDATE tblpreinscripcion
        SET estado = 0
        WHERE `documentoUsuario` = `documentoUsuar`;
    set msg= CONVERT(CONCAT('Este cliente se ha registrado como estudiante') using utf8);
    select msg as mensaje, 'success' as tipo;    
END IF;
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
	if (exists(select idIncripcion from tblinscripcion where idIncripcion=idIncripci)) then
		set msg=CONVERT("Esta inscripción ya existe" using utf8);
		select msg as Respuesta;
	else
		insert into tblinscripcion (idIncripcion,idSeminario, precioSeminario, fechaAsistencia,idVenta) Values(idIncripci,idSeminar,precioSeminar,fechaAsistenc,idVen);
		set msg=CONVERT("La inscripción se ha registrado exitosamente" using utf8);
		select msg as Respuesta; 
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarInscritoSeminario`(
 in `documen` varchar(20),
 in `nombr` varchar(50),
 in `telefo` varchar (20),
in  `corr` varchar (30), 
 in `idseminar` int
 )
BEGIN
    IF ((select `cupoSeminario` from tblcurso where `idCurso` = `idseminar`)>0) then
    INSERT INTO `tblinscrito`
        (
            `documento`, `nombres`, `telefono`, `correo`, `idseminario`
        ) 
    VALUES (`documen`, `nombr`, `telefo`, `corr`, `idseminar`);
    UPDATE tblcurso SET `cupoSeminario` = `cupoSeminario`-1 WHERE `idCurso` = `idseminar`;
    ELSE 
        select -1 as respuesta;
    END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarMovimientoCredito`(
    in total             int,
    in documentoUsuar       VARCHAR(30) ,    
    in documentoClien       VARCHAR(45)
 )
BEGIN
    declare msg varchar(40);  
    declare nombreClien VARCHAR(50);
    set nombreClien = (SELECT concat(`nombreUsuario`, ' ', `apellidoUsuario`) FROM tblusuario where `documentoUsuario` = `documentoClien`);
        insert into tblmovimiento 
        (
            `fechaMovimiento`, 
            `totalMovimiento`, 
            `idtipoMovimiento`, 
            `documentoUsuario`, 
            `nombreAuxiliar`,
            documentoAuxiliar
        ) VALUES (
            NOW(),
            `total`,
            4,
            documentoUsuar,
            `nombreClien`,
            documentoClien
        );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarPreinscripcion`(
    `documentoUsuar` varchar(45), 
    `idCur` int
)
BEGIN	

declare msg varchar(100);    
    if (exists(SELECT `documentoUsuario` FROM `tblpreinscripcion` WHERE `documentoUsuario` = `documentoUsuar` and `idCurso` = `idCur`)) then
		set msg= CONVERT(CONCAT('Este cliente ya se ha preinscrito a ',(SELECT `nombreCurso` from tblcurso WHERE `idCurso` = idCur)) using utf8);
		select msg as mensaje, 'error' as tipo;
    elseif (exists(SELECT `documentoUsuario` FROM `tblpreinscripcion` WHERE `documentoUsuario` = `documentoUsuar` and estado = 1)) then
                set msg=CONVERT(CONCAT('Este cliente se encuentra preinscrito a ',(SELECT `nombreCurso` from tblcurso WHERE `idCurso` = (SELECT idCurso from `tblpreinscripcion` WHERE `documentoUsuario` = `documentoUsuar` and estado = 1))) using utf8);
		select msg as mensaje, 'error' as tipo;
    elseif (exists(SELECT `documentoUsuario` FROM `tblusuario` WHERE `documentoUsuario` = `documentoUsuar` and idrol !=4)) then
                set msg=CONVERT(CONCAT('Usted cuenta con rol de ', (SELECT descripcion FROM tblrol WHERE idrol = (SELECT idrol FROM tblusuario WHERE `documentoUsuario` = `documentoUsuar`)), ' por lo cual no se puede preinscribir.') using utf8);
		select msg as mensaje, 'error' as tipo;
    else
    INSERT INTO `tblpreinscripcion`
    (
        `estado`, 
        `documentoUsuario`, 
        `idCurso`
    ) 
    VALUES  
    (
        1, 
        `documentoUsuar`, 
        `idCur`
    );
    set msg= CONVERT(CONCAT('Se ha registrado su preincripción a ',(SELECT `nombreCurso` from tblcurso WHERE `idCurso` = idCur)) using utf8);
    select msg as mensaje, 'success' as tipo;
end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarSeminario`(
    in nombre varchar(30),
    in cantidad int,
    in horas int,
    in estado int,
    in descripcion varchar(100),
    in precio int,
    in fecha DATETIME,
    in cupo int,
    in idcategoria int
)
BEGIN
IF ((SELECT idcurso FROM tblcurso WHERE LOWER(`nombreCurso`) = LOWER(`nombre`) AND idcategoria=1)IS NOT NULL) THEN
        SELECT -1;
    ELSE
INSERT INTO `tblcurso`(
    `nombreCurso`, 
    `cantidadClases`, 
    `horasPorClase`, 
    `estadoCurso`, 
    `descripcionCurso`, 
    `precioCurso`,
     fechaSeminario,
     cupoSeminario,
    `idCategoriaCurso`
) VALUES (
    nombre,
    cantidad,
    horas,
    estado,
    descripcion,
    precio,
    fecha,
    cupo,
    idcategoria
);
END IF;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarUsuario`(
    in `documentoUsuar` varchar(40), 
    in `fechaNacimien` date, 
    in `nombreUsuar` varchar(40), 
    in `apellidoUsuar` varchar(40), 
    in `telefonoFij` varchar(40), 
    in `emailUsuar` varchar(40), 
    in `passwo` varchar(40), 
    in `estadoUsuar` int, 
    in `idr` int
 )
BEGIN
INSERT INTO `tblusuario`
(
    `documentoUsuario`, 
    `fechaNacimiento`, 
    `nombreUsuario`, 
    `apellidoUsuario`, 
    `telefonoFijo`, 
    `emailUsuario`, 
    `password`, 
    `estadoUsuario`, 
    `idrol`
) 
VALUES 
(
    `documentoUsuar`, 
    `fechaNacimien`, 
    `nombreUsuar`, 
    `apellidoUsuar`, 
    `telefonoFij`, 
    `emailUsuar`, 
    `passwo`, 
    `estadoUsuar`, 
    `idr`
);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spIngresarVenta`(
    in idVen                int,
    in totalVen             int,
    in documentoUsuar       VARCHAR(30) ,
    in nombreClien          VARCHAR(30),
    in documentoClien       VARCHAR(45)
 )
BEGIN
	declare msg varchar(40);    
	if (exists(select numeroAuxiliar from tblmovimiento where numeroAuxiliar=`idVen` and `idtipoMovimiento`=3)) then
		set msg="Esta venta ya existe";
		select msg as Respuesta;
	else
            insert into tblmovimiento 
            (
                `fechaMovimiento`, 
                `totalMovimiento`, 
                `idtipoMovimiento`, 
                `documentoUsuario`, 
                `nombreAuxiliar`,
                `numeroAuxiliar`,
                documentoAuxiliar
            ) VALUES (
                NOW(),
                `totalVen`,
                3,
                documentoUsuar,
                `nombreClien`,
                idVen,
                documentoClien
            );
	end if;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarArticulos`()
BEGIN
    SELECT  
        a.idArticulo as idArticulo,
        a.descripcionArticulo as descripcionArticulo, 
        a.cantidadDisponible as cantidadDisponible, 
        a.precioCompra as precioCompra, 
        a.precioVenta as precioVenta, 
        a.idCategoriaArticulo as idCategoriaArticulo, 
        ca.nombreCategoriaArticulo as nombreCategoriaArticulo
    FROM tblarticulo a INNER JOIN tblcategoriaarticulo ca ON a.idCategoriaArticulo = ca.idCategoriaArticulo;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarArticulosConExistencias`()
BEGIN
    SELECT  
        a.idArticulo as idArticulo,
        a.descripcionArticulo as descripcionArticulo, 
        a.cantidadDisponible as cantidadDisponible, 
        a.precioCompra as precioCompra, 
        a.precioVenta as precioVenta, 
        a.idCategoriaArticulo as idCategoriaArticulo, 
        ca.nombreCategoriaArticulo as nombreCategoriaArticulo
    FROM tblarticulo a INNER JOIN tblcategoriaarticulo ca ON a.idCategoriaArticulo = ca.idCategoriaArticulo WHERE a.cantidadDisponible > 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarCreditos`()
BEGIN
SELECT `idCredito`, c.`documentoUsuario` as `documentoUsuario`, CONCAT(`nombreUsuario`, ' ', `apellidoUsuario`) as nombre, `fechaInicio`, `saldoInicial`, `saldoActual`, `estadoCredito`
FROM tblcredito c inner join tblusuario u on(c.`documentoUsuario` = u.`documentoUsuario`);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarDetalleCreditos`()
Begin
select d.idDetalleCredito, d.idCredito, d.idMovimiento, d.fechaDetalle
from tbldetallecredito d inner join tblcredito c on(d.idCredito = c.idCredito);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spListarEmpresas`()
BEGIN

SELECT nitEmpresa, nombreEmpresa, direccionEmpresa, nombreContacto, telefonoContacto, emailContacto FROM tblempresa;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblacudiente`
--

CREATE TABLE IF NOT EXISTS `tblacudiente` (
  `documentoAcudiente` varchar(20) NOT NULL,
  `nombreAcudiente` varchar(50) NOT NULL,
  `telefonoAcudiente` varchar(50) NOT NULL,
  `fechaNacimiento` date NOT NULL
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
  `precioCompra` int(11) NOT NULL,
  `precioVenta` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblarticulo`
--

INSERT INTO `tblarticulo` (`idArticulo`, `idCategoriaArticulo`, `descripcionArticulo`, `cantidadDisponible`, `precioCompra`, `precioVenta`) VALUES
(1, 2, 'Pincel delgado', 36, 1200, 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategoriaarticulo`
--

CREATE TABLE IF NOT EXISTS `tblcategoriaarticulo` (
`idCategoriaArticulo` int(11) NOT NULL,
  `nombreCategoriaArticulo` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblcategoriaarticulo`
--

INSERT INTO `tblcategoriaarticulo` (`idCategoriaArticulo`, `nombreCategoriaArticulo`) VALUES
(1, 'Vinilos'),
(2, 'Pinceles');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcategoriacurso`
--

CREATE TABLE IF NOT EXISTS `tblcategoriacurso` (
`idCategoriaCurso` int(11) NOT NULL,
  `nombreCategoriaCurso` varchar(45) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblcategoriacurso`
--

INSERT INTO `tblcategoriacurso` (`idCategoriaCurso`, `nombreCategoriaCurso`) VALUES
(1, 'Madera'),
(2, 'Pintura'),
(3, 'Seminario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblclase`
--

CREATE TABLE IF NOT EXISTS `tblclase` (
`idClase` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `estadoPago` bit(1) NOT NULL DEFAULT b'0',
  `estadoAsistencia` bit(1) NOT NULL DEFAULT b'0',
  `creditoCreado` bit(1) NOT NULL DEFAULT b'0',
  `precioClase` float NOT NULL,
  `idCurso` int(11) NOT NULL,
  `documentoUsuario` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tblclase`
--

INSERT INTO `tblclase` (`idClase`, `fecha`, `estadoPago`, `estadoAsistencia`, `creditoCreado`, `precioClase`, `idCurso`, `documentoUsuario`) VALUES
(1, '2015-09-07', b'0', b'1', b'1', 12000, 2, 'CC32165498'),
(2, '2015-09-07', b'0', b'1', b'1', 12000, 2, 'CC32165498'),
(3, '2015-09-07', b'0', b'1', b'1', 12000, 2, 'CC32165498'),
(4, '2015-09-07', b'0', b'1', b'1', 12000, 2, 'CC32165498'),
(5, '2015-09-07', b'0', b'1', b'1', 12000, 2, 'CC32165498'),
(6, NULL, b'0', b'0', b'0', 12000, 2, 'CC32165498'),
(7, NULL, b'0', b'0', b'0', 12000, 2, 'CC32165498'),
(8, NULL, b'0', b'0', b'0', 12000, 2, 'CC32165498'),
(9, NULL, b'0', b'0', b'0', 12000, 2, 'CC32165498'),
(10, NULL, b'0', b'0', b'0', 12000, 2, 'CC32165498');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcredito`
--

CREATE TABLE IF NOT EXISTS `tblcredito` (
`idCredito` int(11) NOT NULL,
  `documentoUsuario` varchar(20) NOT NULL,
  `fechaInicio` datetime DEFAULT CURRENT_TIMESTAMP,
  `saldoInicial` int(11) NOT NULL DEFAULT '0',
  `saldoActual` int(11) NOT NULL DEFAULT '0',
  `estadoCredito` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblcredito`
--

INSERT INTO `tblcredito` (`idCredito`, `documentoUsuario`, `fechaInicio`, `saldoInicial`, `saldoActual`, `estadoCredito`) VALUES
(1, 'CC32165498', '2015-09-07 20:53:14', 50000, 28000, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblcurso`
--

CREATE TABLE IF NOT EXISTS `tblcurso` (
`idCurso` int(11) NOT NULL,
  `nombreCurso` varchar(50) NOT NULL,
  `cantidadClases` int(11) NOT NULL,
  `horasPorClase` int(11) NOT NULL,
  `estadoCurso` int(11) NOT NULL,
  `descripcionCurso` varchar(100) DEFAULT NULL,
  `precioCurso` int(11) DEFAULT NULL,
  `fechaSeminario` datetime DEFAULT NULL,
  `cupoSeminario` int(11) DEFAULT NULL,
  `idCategoriaCurso` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblcurso`
--

INSERT INTO `tblcurso` (`idCurso`, `nombreCurso`, `cantidadClases`, `horasPorClase`, `estadoCurso`, `descripcionCurso`, `precioCurso`, `fechaSeminario`, `cupoSeminario`, `idCategoriaCurso`) VALUES
(1, 'Seminario Prueba', 1, 3, 1, 'Este es un seminario de prueba', 50000, '2015-09-09 14:30:00', 15, 3),
(2, 'Madera blanda', 10, 2, 1, 'Un curso de madera blanda, no apta para hacer espadas.', 120000, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetallecredito`
--

CREATE TABLE IF NOT EXISTS `tbldetallecredito` (
`idDetalleCredito` int(11) NOT NULL,
  `idCredito` int(11) NOT NULL,
  `idMovimiento` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbldetallecredito`
--

INSERT INTO `tbldetallecredito` (`idDetalleCredito`, `idCredito`, `idMovimiento`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetallemovimiento`
--

CREATE TABLE IF NOT EXISTS `tbldetallemovimiento` (
`idDetalleMovimiento` int(11) NOT NULL,
  `idArticulo` int(11) DEFAULT NULL,
  `idClase` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) DEFAULT NULL,
  `totalDetalleMovimiento` int(11) NOT NULL,
  `idMovimiento` int(11) NOT NULL,
  `precioArticulo` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tbldetallemovimiento`
--

INSERT INTO `tbldetallemovimiento` (`idDetalleMovimiento`, `idArticulo`, `idClase`, `cantidad`, `descuento`, `totalDetalleMovimiento`, `idMovimiento`, `precioArticulo`) VALUES
(1, 1, NULL, 50, 1, 60000, 1, 1200),
(2, 1, NULL, 2, 1, 3000, 2, 1500),
(3, 1, NULL, 2, 1, 3000, 3, 1500),
(4, NULL, 4, 1, 0, 12000, 4, 12000),
(5, NULL, 5, 1, 0, 12000, 5, 12000),
(6, 1, NULL, 10, 1, 15000, 7, 1500);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbldetalleusuario`
--

CREATE TABLE IF NOT EXISTS `tbldetalleusuario` (
`idDetalleUsuario` int(11) NOT NULL,
  `direccionUsuario` varchar(50) NOT NULL,
  `telefonoMovil` varchar(15) NOT NULL,
  `generoUsuario` bit(1) NOT NULL,
  `estadoBeneficiario` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbldetalleusuario`
--

INSERT INTO `tbldetalleusuario` (`idDetalleUsuario`, `direccionUsuario`, `telefonoMovil`, `generoUsuario`, `estadoBeneficiario`) VALUES
(3, 'Calle x # 62 e 03', '3125368954', b'0', b'0');

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
-- Estructura de tabla para la tabla `tblinscrito`
--

CREATE TABLE IF NOT EXISTS `tblinscrito` (
`idinscrito` int(11) NOT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `nombres` varchar(40) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(40) NOT NULL,
  `idseminario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmodulo`
--

CREATE TABLE IF NOT EXISTS `tblmodulo` (
`idmodulo` int(11) NOT NULL,
  `enlace` varchar(30) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblmodulo`
--

INSERT INTO `tblmodulo` (`idmodulo`, `enlace`, `nombre`) VALUES
(1, 'matricula.jsp', 'Matrículas'),
(2, 'empresa.jsp', 'Empresas'),
(3, 'curso.jsp', 'Cursos y Seminarios'),
(5, 'articulo.jsp', 'Artículos'),
(6, 'caja.jsp', 'Caja'),
(7, 'nuestro.jsp', 'Nuestros Cursos'),
(8, 'acerca.jsp', 'Acerca de Nosotros'),
(9, 'operario.jsp', 'Operarios');

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
(9, 1),
(1, 2),
(2, 2),
(3, 2),
(5, 2),
(6, 2),
(7, 3),
(8, 3),
(7, 4),
(8, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblmovimiento`
--

CREATE TABLE IF NOT EXISTS `tblmovimiento` (
`idMovimiento` int(11) NOT NULL,
  `fechaMovimiento` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `totalMovimiento` int(11) NOT NULL,
  `idtipoMovimiento` int(11) NOT NULL,
  `documentoUsuario` varchar(20) NOT NULL,
  `numeroAuxiliar` varchar(45) DEFAULT NULL,
  `nombreAuxiliar` varchar(45) DEFAULT NULL,
  `documentoAuxiliar` varchar(45) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblmovimiento`
--

INSERT INTO `tblmovimiento` (`idMovimiento`, `fechaMovimiento`, `totalMovimiento`, `idtipoMovimiento`, `documentoUsuario`, `numeroAuxiliar`, `nombreAuxiliar`, `documentoAuxiliar`) VALUES
(1, '2015-09-07 20:50:25', 60000, 1, 'CC1017225673', '1', 'Pinseles S.A', NULL),
(2, '2015-09-07 20:52:47', 3000, 3, 'CC1017225673', '1', 'Esteban de la olla', 'TI94110325805'),
(3, '2015-09-07 20:53:14', 3000, 4, 'CC1017225673', NULL, 'Maria Eugenia Restrepo Velez', 'CC32165498'),
(4, '2015-09-07 21:02:47', 12000, 4, 'CC1017225673', NULL, 'Maria Eugenia Restrepo Velez', 'CC32165498'),
(5, '2015-09-07 21:02:59', 12000, 4, 'CC1017225673', NULL, 'Maria Eugenia Restrepo Velez', 'CC32165498'),
(6, '2015-09-07 21:08:11', 20000, 5, 'CC1017225673', '1', 'Maria Eugenia Restrepo Velez', 'CC32165498'),
(7, '2015-09-07 22:47:13', 15000, 4, 'CC1017225673', NULL, 'Maria Eugenia Restrepo Velez', 'CC32165498');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblpreinscripcion`
--

CREATE TABLE IF NOT EXISTS `tblpreinscripcion` (
`idPreinscripcion` int(11) NOT NULL,
  `estado` bit(1) DEFAULT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `documentoUsuario` varchar(20) NOT NULL,
  `idCurso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblrol`
--

CREATE TABLE IF NOT EXISTS `tblrol` (
  `nombre` varchar(20) NOT NULL,
  `descripcion` varchar(40) NOT NULL,
`idrol` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblrol`
--

INSERT INTO `tblrol` (`nombre`, `descripcion`, `idrol`) VALUES
('administrador', 'Es quien administra el sistema', 1),
('operador', 'privilegios por debajo del administrador', 2),
('estudiante', 'estudiante registrado', 3),
('cliente', 'cliente registrado', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblsubsidio`
--

CREATE TABLE IF NOT EXISTS `tblsubsidio` (
`idSubsidio` int(11) NOT NULL,
  `fechaAsignacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `valorSubsidio` int(11) NOT NULL,
  `nitEmpresa` varchar(20) NOT NULL,
  `documentoUsuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbltipomovimiento`
--

CREATE TABLE IF NOT EXISTS `tbltipomovimiento` (
  `idtipoMovimiento` int(11) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tbltipomovimiento`
--

INSERT INTO `tbltipomovimiento` (`idtipoMovimiento`, `descripcion`) VALUES
(1, 'Compra a Proveedor'),
(2, 'Ingreso de producto propio'),
(3, 'Venta a cliente'),
(4, 'Credito'),
(5, 'Abono');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tblusuario`
--

CREATE TABLE IF NOT EXISTS `tblusuario` (
  `documentoUsuario` varchar(20) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `nombreUsuario` varchar(30) NOT NULL,
  `apellidoUsuario` varchar(30) NOT NULL,
  `emailUsuario` varchar(50) NOT NULL,
  `password` varchar(45) NOT NULL,
  `estadoUsuario` int(11) NOT NULL,
  `idDetalleUsuario` int(11) DEFAULT NULL,
  `idrol` int(11) NOT NULL,
  `documentoAcudiente` varchar(20) DEFAULT NULL,
  `telefonoFijo` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tblusuario`
--

INSERT INTO `tblusuario` (`documentoUsuario`, `fechaNacimiento`, `nombreUsuario`, `apellidoUsuario`, `emailUsuario`, `password`, `estadoUsuario`, `idDetalleUsuario`, `idrol`, `documentoAcudiente`, `telefonoFijo`) VALUES
('CC1017225673', '1994-11-03', 'Juan Sebastian', 'Montoya Montoya', 'jsmontoya37@misena.edu.co', 'Es1203*', 1, NULL, 1, NULL, '5861529'),
('CC123456', '1990-01-01', 'Super', 'Admin', 'admin@workstation.com', 'Admin123', 1, NULL, 1, NULL, '5861529'),
('CC32165498', '1980-09-03', 'Maria Eugenia', 'Restrepo Velez', 'mariaerv@correo.com', 'Ab123*', 0, 3, 3, NULL, '5862025');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tblacudiente`
--
ALTER TABLE `tblacudiente`
 ADD PRIMARY KEY (`documentoAcudiente`);

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
 ADD PRIMARY KEY (`idCategoriaCurso`);

--
-- Indices de la tabla `tblclase`
--
ALTER TABLE `tblclase`
 ADD PRIMARY KEY (`idClase`), ADD KEY `idCurso_idx` (`idCurso`);

--
-- Indices de la tabla `tblcredito`
--
ALTER TABLE `tblcredito`
 ADD PRIMARY KEY (`idCredito`), ADD KEY `fk_tblcredito_tblusuario1` (`documentoUsuario`);

--
-- Indices de la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
 ADD PRIMARY KEY (`idCurso`), ADD KEY `fk_tblcurso_tblcategoriacurso1_idx` (`idCategoriaCurso`);

--
-- Indices de la tabla `tbldetallecredito`
--
ALTER TABLE `tbldetallecredito`
 ADD PRIMARY KEY (`idDetalleCredito`), ADD KEY `idMovimiento` (`idMovimiento`), ADD KEY `idCredito` (`idCredito`);

--
-- Indices de la tabla `tbldetallemovimiento`
--
ALTER TABLE `tbldetallemovimiento`
 ADD PRIMARY KEY (`idDetalleMovimiento`), ADD KEY `FK_tblDetalleVenta_idArticulo` (`idArticulo`), ADD KEY `fk_tbldetallemovimiento_tblMovimiento1_idx` (`idMovimiento`);

--
-- Indices de la tabla `tbldetalleusuario`
--
ALTER TABLE `tbldetalleusuario`
 ADD PRIMARY KEY (`idDetalleUsuario`);

--
-- Indices de la tabla `tblempresa`
--
ALTER TABLE `tblempresa`
 ADD PRIMARY KEY (`nitEmpresa`);

--
-- Indices de la tabla `tblinscrito`
--
ALTER TABLE `tblinscrito`
 ADD PRIMARY KEY (`idinscrito`);

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
-- Indices de la tabla `tblmovimiento`
--
ALTER TABLE `tblmovimiento`
 ADD PRIMARY KEY (`idMovimiento`), ADD KEY `fk_tblMovimiento_tblTipoMovimiento1_idx` (`idtipoMovimiento`), ADD KEY `fk_tblMovimiento_tblusuario1_idx` (`documentoUsuario`);

--
-- Indices de la tabla `tblpreinscripcion`
--
ALTER TABLE `tblpreinscripcion`
 ADD PRIMARY KEY (`idPreinscripcion`);

--
-- Indices de la tabla `tblrol`
--
ALTER TABLE `tblrol`
 ADD PRIMARY KEY (`idrol`);

--
-- Indices de la tabla `tblsubsidio`
--
ALTER TABLE `tblsubsidio`
 ADD PRIMARY KEY (`idSubsidio`), ADD KEY `fk_tblsubsidio_tblempresa1_idx` (`nitEmpresa`), ADD KEY `fk_tblsubsidio_tblusuario1_idx` (`documentoUsuario`);

--
-- Indices de la tabla `tbltipomovimiento`
--
ALTER TABLE `tbltipomovimiento`
 ADD PRIMARY KEY (`idtipoMovimiento`);

--
-- Indices de la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
 ADD PRIMARY KEY (`documentoUsuario`), ADD UNIQUE KEY `emailUsuario_UNIQUE` (`emailUsuario`), ADD KEY `fk_tblestudiante_tblDetalleCliente1_idx` (`idDetalleUsuario`), ADD KEY `fk_tblusuario_tblrol1_idx` (`idrol`), ADD KEY `fk_tblusuario_tblacudiente1_idx` (`documentoAcudiente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tblarticulo`
--
ALTER TABLE `tblarticulo`
MODIFY `idArticulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tblcategoriaarticulo`
--
ALTER TABLE `tblcategoriaarticulo`
MODIFY `idCategoriaArticulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tblcategoriacurso`
--
ALTER TABLE `tblcategoriacurso`
MODIFY `idCategoriaCurso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tblclase`
--
ALTER TABLE `tblclase`
MODIFY `idClase` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT de la tabla `tblcredito`
--
ALTER TABLE `tblcredito`
MODIFY `idCredito` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
MODIFY `idCurso` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `tbldetallecredito`
--
ALTER TABLE `tbldetallecredito`
MODIFY `idDetalleCredito` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tbldetallemovimiento`
--
ALTER TABLE `tbldetallemovimiento`
MODIFY `idDetalleMovimiento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `tbldetalleusuario`
--
ALTER TABLE `tbldetalleusuario`
MODIFY `idDetalleUsuario` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `tblinscrito`
--
ALTER TABLE `tblinscrito`
MODIFY `idinscrito` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblmodulo`
--
ALTER TABLE `tblmodulo`
MODIFY `idmodulo` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT de la tabla `tblmovimiento`
--
ALTER TABLE `tblmovimiento`
MODIFY `idMovimiento` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `tblpreinscripcion`
--
ALTER TABLE `tblpreinscripcion`
MODIFY `idPreinscripcion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `tblrol`
--
ALTER TABLE `tblrol`
MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `tblsubsidio`
--
ALTER TABLE `tblsubsidio`
MODIFY `idSubsidio` int(11) NOT NULL AUTO_INCREMENT;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tblarticulo`
--
ALTER TABLE `tblarticulo`
ADD CONSTRAINT `FK_tblArticulo_idCategoriaArticulo` FOREIGN KEY (`idCategoriaArticulo`) REFERENCES `tblcategoriaarticulo` (`idCategoriaArticulo`);

--
-- Filtros para la tabla `tblclase`
--
ALTER TABLE `tblclase`
ADD CONSTRAINT `tblclase_ibfk_1` FOREIGN KEY (`idCurso`) REFERENCES `tblcurso` (`idCurso`);

--
-- Filtros para la tabla `tblcredito`
--
ALTER TABLE `tblcredito`
ADD CONSTRAINT `fk_tblcredito_tblusuario1` FOREIGN KEY (`documentoUsuario`) REFERENCES `tblusuario` (`documentoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblcurso`
--
ALTER TABLE `tblcurso`
ADD CONSTRAINT `fk_tblcurso_tblcategoriacurso1` FOREIGN KEY (`idCategoriaCurso`) REFERENCES `tblcategoriacurso` (`idCategoriaCurso`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `tbldetallecredito`
--
ALTER TABLE `tbldetallecredito`
ADD CONSTRAINT `tbldetallecredito_ibfk_1` FOREIGN KEY (`idMovimiento`) REFERENCES `tblmovimiento` (`idMovimiento`),
ADD CONSTRAINT `tbldetallecredito_ibfk_2` FOREIGN KEY (`idCredito`) REFERENCES `tblcredito` (`idCredito`);

--
-- Filtros para la tabla `tblmodulorol`
--
ALTER TABLE `tblmodulorol`
ADD CONSTRAINT `tblmodulorol_ibfk_1` FOREIGN KEY (`idmodulo`) REFERENCES `tblmodulo` (`idmodulo`),
ADD CONSTRAINT `tblmodulorol_ibfk_2` FOREIGN KEY (`idrol`) REFERENCES `tblrol` (`idrol`);

--
-- Filtros para la tabla `tblmovimiento`
--
ALTER TABLE `tblmovimiento`
ADD CONSTRAINT `fk_tblMovimiento_tblTipoMovimiento1` FOREIGN KEY (`idtipoMovimiento`) REFERENCES `tbltipomovimiento` (`idtipoMovimiento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tblMovimiento_tblusuario1` FOREIGN KEY (`documentoUsuario`) REFERENCES `tblusuario` (`documentoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblsubsidio`
--
ALTER TABLE `tblsubsidio`
ADD CONSTRAINT `fk_tblsubsidio_tblempresa1` FOREIGN KEY (`nitEmpresa`) REFERENCES `tblempresa` (`nitEmpresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tblsubsidio_tblusuario1` FOREIGN KEY (`documentoUsuario`) REFERENCES `tblusuario` (`documentoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `tblusuario`
--
ALTER TABLE `tblusuario`
ADD CONSTRAINT `fk_tblusuario_tblacudiente1` FOREIGN KEY (`documentoAcudiente`) REFERENCES `tblacudiente` (`documentoAcudiente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_tblusuario_tblrol1` FOREIGN KEY (`idrol`) REFERENCES `tblrol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `tblusuario_ibfk_1` FOREIGN KEY (`idDetalleUsuario`) REFERENCES `tbldetalleusuario` (`idDetalleUsuario`) ON DELETE SET NULL ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
