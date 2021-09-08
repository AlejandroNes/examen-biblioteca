-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2021 a las 09:52:16
-- Versión del servidor: 10.4.17-MariaDB
-- Versión de PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autor`
--

CREATE TABLE `autor` (
  `cod_autor` int(11) NOT NULL COMMENT 'TRIAL',
  `paterno` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `materno` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `nombre` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `nacionalidad` varchar(30) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `autor`
--

INSERT INTO `autor` (`cod_autor`, `paterno`, `materno`, `nombre`, `nacionalidad`) VALUES
(1, 'YUJRA', 'RIVERO', 'FERNANDO', 'PERU'),
(2, 'ROJAS', 'GUZMAN', 'TORREZ', 'ARGENTINA'),
(3, 'BLANCO', 'TORREZ', 'VERONICA', 'BRASIL'),
(4, 'JOYANES', 'AGUILAR', 'LUIS', 'ESPAÑA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libro`
--

CREATE TABLE `libro` (
  `cod_libro` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_autor` decimal(3,0) NOT NULL COMMENT 'TRIAL',
  `titulo` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `edicion` decimal(3,0) DEFAULT NULL COMMENT 'TRIAL',
  `nroejemplar` decimal(3,0) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `libro`
--

INSERT INTO `libro` (`cod_libro`, `cod_autor`, `titulo`, `edicion`, `nroejemplar`) VALUES
(1, '2', 'Base de Datos', '3', '2'),
(2, '1', 'Programacion Basica', '2', '5'),
(3, '1', 'Programacion de Objetos', '2', '4'),
(4, '2', 'Programacion Funcional', '3', '5'),
(6, '3', 'Redes', '3', '4'),
(7, '2', 'Introduccion a la Programacion', '4', '4');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `cod_prestamo` int(11) NOT NULL COMMENT 'TRIAL',
  `cod_libro` decimal(3,0) NOT NULL COMMENT 'TRIAL',
  `cedula_usr` decimal(8,0) NOT NULL COMMENT 'TRIAL',
  `fecha_prestamo` datetime DEFAULT NULL COMMENT 'TRIAL',
  `fecha_devolucion` datetime DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`cod_prestamo`, `cod_libro`, `cedula_usr`, `fecha_prestamo`, `fecha_devolucion`) VALUES
(1, '1', '4567892', '2019-05-10 00:00:00', '2019-05-12 00:00:00'),
(2, '2', '4567892', '2019-05-13 00:00:00', '2019-05-15 00:00:00'),
(3, '2', '7894561', '2019-05-13 00:00:00', '2019-05-15 00:00:00'),
(4, '3', '7894561', '2019-06-05 00:00:00', '2019-06-07 00:00:00'),
(5, '3', '7894561', '2019-06-10 00:00:00', '2019-06-12 00:00:00'),
(6, '7', '7894561', '2019-06-12 00:00:00', '2019-06-13 00:00:00'),
(7, '6', '4567892', '2019-06-12 00:00:00', '2019-06-13 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `cedula_usr` decimal(8,0) NOT NULL COMMENT 'TRIAL',
  `paterno_usr` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `materno_usr` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `nombre_usr` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `expedido_usr` varchar(30) DEFAULT NULL COMMENT 'TRIAL',
  `telefono_usr` decimal(8,0) DEFAULT NULL COMMENT 'TRIAL',
  `direccion` varchar(100) DEFAULT NULL COMMENT 'TRIAL'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='TRIAL';

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`cedula_usr`, `paterno_usr`, `materno_usr`, `nombre_usr`, `expedido_usr`, `telefono_usr`, `direccion`) VALUES
('4567892', 'ROJAS', 'COSIO', 'DIEGO', 'LA PAZ', '72548996', 'Z/ CIUDAD SATELITE'),
('7894561', 'VERA', 'NINA', 'CARLOS', 'LA PAZ', '73025698', 'Z/ RIO SECO');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autor`
--
ALTER TABLE `autor`
  ADD PRIMARY KEY (`cod_autor`);

--
-- Indices de la tabla `libro`
--
ALTER TABLE `libro`
  ADD PRIMARY KEY (`cod_libro`),
  ADD KEY `posee_fk` (`cod_autor`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`cod_prestamo`),
  ADD KEY `prestamo2_fk` (`cedula_usr`),
  ADD KEY `prestamo_fk` (`cod_libro`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`cedula_usr`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autor`
--
ALTER TABLE `autor`
  MODIFY `cod_autor` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `libro`
--
ALTER TABLE `libro`
  MODIFY `cod_libro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `cod_prestamo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'TRIAL', AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_prestamo_prestamo2_usuario` FOREIGN KEY (`cedula_usr`) REFERENCES `usuario` (`cedula_usr`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
