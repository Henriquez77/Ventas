-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2026 a las 21:01:22
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ventas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `caja`
--

CREATE TABLE `caja` (
  `caja_id` int(5) NOT NULL,
  `caja_numero` int(5) NOT NULL,
  `caja_nombre` varchar(100) NOT NULL,
  `caja_efectivo` decimal(30,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numero`, `caja_nombre`, `caja_efectivo`) VALUES
(1, 1, 'Caja Principal', 3656.07);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(7) NOT NULL,
  `categoria_nombre` varchar(50) NOT NULL,
  `categoria_ubicacion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_ubicacion`) VALUES
(35, 'Laptops', 'Tecnologia'),
(36, 'Desktops', 'Tecnologia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `cliente_id` int(10) NOT NULL,
  `cliente_tipo_documento` varchar(20) NOT NULL,
  `cliente_numero_documento` varchar(35) NOT NULL,
  `cliente_nombre` varchar(50) NOT NULL,
  `cliente_apellido` varchar(50) NOT NULL,
  `cliente_provincia` varchar(30) NOT NULL,
  `cliente_ciudad` varchar(30) NOT NULL,
  `cliente_direccion` varchar(70) NOT NULL,
  `cliente_telefono` varchar(20) NOT NULL,
  `cliente_email` varchar(50) NOT NULL,
  `cliente_key` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_tipo_documento`, `cliente_numero_documento`, `cliente_nombre`, `cliente_apellido`, `cliente_provincia`, `cliente_ciudad`, `cliente_direccion`, `cliente_telefono`, `cliente_email`, `cliente_key`) VALUES
(44, 'Otro', '4064914689', 'pueba', 'prueba', 'San Miguel', 'san miguel', 'san miguel', '60495235', 'jhonatanernesto.henrriquez@gmail.com', 're_eGYkCkBZ_Aj3JUFZLZTdbWRDxp1vepCHy'),
(45, 'Otro', '8234146372', 'Katy', 'Renderos', 'San Miguel', 'San Miguel', 'San Miguel', '21212828', 'renderosyamileth8@gmail.com', 're_bXvZgD4p_58k4y6iiKUHsVo1L7QCVcBQD'),
(46, 'Otro', '0738965573', 'Elvis', 'Rubio', 'San Miguel', 'San Miguel', 'San Miguel', '23235858', 'rubioelvis669@gmail.com', 're_ZPd8aZsF_F7aW3HquQgrmeYkbLuvP5Buq'),
(47, 'Otro', '7286357781', 'Elvis', 'UNAB', 'La Union', 'El Sauce', 'Casa', '65697898', 'unab@gamil.com', 're_ZPd8aZsF_F7aW3HquQgrmeYkbLuvP5Buq');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion`
--

CREATE TABLE `cotizacion` (
  `cotizacion_id` int(30) NOT NULL,
  `cotizacion_codigo` varchar(200) NOT NULL,
  `cotizacion_fecha` date NOT NULL,
  `cotizacion_hora` varchar(17) NOT NULL,
  `cotizacion_total` decimal(30,2) NOT NULL,
  `cotizacion_envio` decimal(30,2) NOT NULL DEFAULT 0.00,
  `usuario_id` int(7) NOT NULL,
  `cliente_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`cotizacion_id`, `cotizacion_codigo`, `cotizacion_fecha`, `cotizacion_hora`, `cotizacion_total`, `cotizacion_envio`, `usuario_id`, `cliente_id`) VALUES
(6, 'Q1N6O4F3V0-1', '2026-04-30', '10:02 am', 750.00, 30.00, 1, 46);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_detalle`
--

CREATE TABLE `cotizacion_detalle` (
  `cotizacion_detalle_id` int(100) NOT NULL,
  `cotizacion_detalle_cantidad` int(10) NOT NULL,
  `cotizacion_detalle_precio_compra` decimal(30,2) NOT NULL,
  `cotizacion_detalle_precio_venta` decimal(30,2) NOT NULL,
  `cotizacion_detalle_total` decimal(30,2) NOT NULL,
  `cotizacion_detalle_descripcion` varchar(200) NOT NULL,
  `cotizacion_codigo` varchar(200) NOT NULL,
  `producto_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `cotizacion_detalle`
--

INSERT INTO `cotizacion_detalle` (`cotizacion_detalle_id`, `cotizacion_detalle_cantidad`, `cotizacion_detalle_precio_compra`, `cotizacion_detalle_precio_venta`, `cotizacion_detalle_total`, `cotizacion_detalle_descripcion`, `cotizacion_codigo`, `producto_id`) VALUES
(6, 1, 620.00, 750.00, 750.00, 'PC All in One HP 22\"', 'Q1N6O4F3V0-1', 128);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL,
  `empresa_nombre` varchar(90) NOT NULL,
  `empresa_telefono` varchar(20) NOT NULL,
  `empresa_email` varchar(50) NOT NULL,
  `empresa_direccion` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `empresa`
--

INSERT INTO `empresa` (`empresa_id`, `empresa_nombre`, `empresa_telefono`, `empresa_email`, `empresa_direccion`) VALUES
(1, 'HWSolutions', '79268145', 'hwsolutionssm@gmail.com', 'San Miguel');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(20) NOT NULL,
  `producto_codigo` varchar(77) NOT NULL,
  `producto_nombre` varchar(100) NOT NULL,
  `producto_stock_total` int(25) NOT NULL,
  `producto_costo_compra` decimal(30,2) NOT NULL,
  `producto_costo_envio` decimal(30,2) NOT NULL,
  `producto_envio_venta` decimal(30,2) NOT NULL DEFAULT 0.00,
  `producto_costo_unidad` decimal(30,2) NOT NULL,
  `producto_precio_vender` decimal(30,2) NOT NULL,
  `producto_fecha_ingresado` date NOT NULL,
  `producto_foto` varchar(500) NOT NULL,
  `categoria_id` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_stock_total`, `producto_costo_compra`, `producto_costo_envio`, `producto_envio_venta`, `producto_costo_unidad`, `producto_precio_vender`, `producto_fecha_ingresado`, `producto_foto`, `categoria_id`) VALUES
(101, 'LAP001', 'Laptop HP 14 Ryzen 5', 10, 450.00, 15.00, 20.00, 465.00, 550.00, '2026-04-30', '', 35),
(102, 'LAP002', 'Laptop Dell Inspiron i5', 8, 520.00, 15.00, 20.00, 535.00, 620.00, '2026-04-30', '', 35),
(103, 'LAP003', 'Laptop Lenovo IdeaPad 3', 12, 400.00, 12.00, 18.00, 412.00, 500.00, '2026-04-30', '', 35),
(104, 'LAP004', 'Laptop ASUS VivoBook 15', 7, 480.00, 15.00, 20.00, 495.00, 580.00, '2026-04-30', '', 35),
(105, 'LAP005', 'Laptop Acer Aspire 5', 9, 430.00, 14.00, 20.00, 444.00, 530.00, '2026-04-30', 'LAP005_81.jpg', 35),
(106, 'LAP006', 'Laptop HP Pavilion x360', 6, 600.00, 18.00, 25.00, 618.00, 720.00, '2026-04-30', '', 35),
(107, 'LAP007', 'Laptop Dell Latitude 5420', 5, 700.00, 20.00, 30.00, 720.00, 850.00, '2026-04-30', '', 35),
(108, 'LAP008', 'Laptop Lenovo ThinkPad E14', 4, 750.00, 20.00, 30.00, 770.00, 900.00, '2026-04-30', '', 35),
(109, 'LAP009', 'Laptop ASUS TUF Gaming F15', 6, 900.00, 25.00, 35.00, 925.00, 1100.00, '2026-04-30', '', 35),
(110, 'LAP010', 'Laptop MSI GF63 Thin', 5, 850.00, 25.00, 35.00, 875.00, 1050.00, '2026-04-30', '', 35),
(111, 'LAP011', 'Laptop HP Victus Gaming', 7, 950.00, 25.00, 35.00, 975.00, 1150.00, '2026-04-30', '', 35),
(112, 'LAP012', 'Laptop Dell G15 Gaming', 5, 1000.00, 30.00, 40.00, 1030.00, 1250.00, '2026-04-30', '', 35),
(113, 'LAP013', 'Laptop Lenovo Legion 5', 4, 1100.00, 30.00, 40.00, 1130.00, 1350.00, '2026-04-30', '', 35),
(114, 'LAP014', 'Laptop ASUS ROG Strix', 3, 1300.00, 35.00, 45.00, 1335.00, 1550.00, '2026-04-30', '', 35),
(115, 'LAP015', 'Laptop MacBook Air M1', 6, 950.00, 20.00, 30.00, 970.00, 1200.00, '2026-04-30', '', 35),
(116, 'LAP016', 'Laptop MacBook Pro M2', 4, 1400.00, 30.00, 40.00, 1430.00, 1650.00, '2026-04-30', '', 35),
(117, 'LAP017', 'Laptop Samsung Galaxy Book', 8, 700.00, 18.00, 25.00, 718.00, 850.00, '2026-04-30', '', 35),
(118, 'LAP018', 'Laptop Huawei MateBook D15', 7, 650.00, 18.00, 25.00, 668.00, 800.00, '2026-04-30', '', 35),
(119, 'LAP019', 'Laptop LG Gram 14', 3, 1200.00, 30.00, 40.00, 1230.00, 1450.00, '2026-04-30', '', 35),
(120, 'LAP020', 'Laptop Acer Nitro 5', 6, 880.00, 25.00, 35.00, 905.00, 1100.00, '2026-04-30', 'LAP020_73.png', 35),
(121, 'DESK001', 'PC Gamer Ryzen 5 RTX 3060', 5, 900.00, 30.00, 40.00, 930.00, 1150.00, '2026-04-30', '', 36),
(122, 'DESK002', 'PC Gamer i5 RTX 3050', 6, 850.00, 30.00, 40.00, 880.00, 1100.00, '2026-04-30', '', 36),
(123, 'DESK003', 'PC Oficina i3 8GB SSD', 10, 300.00, 15.00, 20.00, 315.00, 400.00, '2026-04-30', '', 36),
(124, 'DESK004', 'PC Oficina Ryzen 3', 9, 320.00, 15.00, 20.00, 335.00, 420.00, '2026-04-30', '', 36),
(125, 'DESK005', 'PC Gamer i7 RTX 3070', 4, 1200.00, 35.00, 50.00, 1235.00, 1500.00, '2026-04-30', '', 36),
(126, 'DESK006', 'PC Gamer Ryzen 7 RTX 3080', 3, 1500.00, 40.00, 60.00, 1540.00, 1800.00, '2026-04-30', '', 36),
(127, 'DESK007', 'PC Mini Office Intel NUC', 7, 400.00, 15.00, 20.00, 415.00, 500.00, '2026-04-30', '', 36),
(128, 'DESK008', 'PC All in One HP 22\"', 1, 600.00, 20.00, 30.00, 620.00, 750.00, '2026-04-30', 'DESK008_41.png', 36),
(129, 'DESK009', 'PC All in One Lenovo 24\"', 4, 650.00, 20.00, 30.00, 670.00, 800.00, '2026-04-30', 'DESK009_28.png', 36),
(130, 'DESK010', 'PC Gamer Ryzen 9 RTX 3090', 2, 2000.00, 50.00, 70.00, 2050.00, 2400.00, '2026-04-30', '', 36),
(131, 'DESK011', 'PC Gamer i9 RTX 4090', 2, 2500.00, 60.00, 80.00, 2560.00, 3000.00, '2026-04-30', '', 36),
(132, 'DESK012', 'PC Oficina i5 16GB SSD', 8, 450.00, 20.00, 25.00, 470.00, 580.00, '2026-04-30', '', 36),
(133, 'DESK013', 'PC Oficina Ryzen 5 16GB', 7, 480.00, 20.00, 25.00, 500.00, 600.00, '2026-04-30', '', 36),
(134, 'DESK014', 'PC Gamer Económico GTX 1650', 6, 600.00, 20.00, 30.00, 620.00, 750.00, '2026-04-30', '', 36),
(135, 'DESK015', 'PC Gamer RTX 2060', 5, 750.00, 25.00, 35.00, 775.00, 950.00, '2026-04-30', '', 36),
(136, 'DESK016', 'PC Streaming Ryzen 7', 4, 1100.00, 30.00, 40.00, 1130.00, 1350.00, '2026-04-30', '', 36),
(137, 'DESK017', 'PC Workstation Xeon', 3, 1300.00, 35.00, 50.00, 1335.00, 1600.00, '2026-04-30', '', 36),
(138, 'DESK018', 'PC Gamer RGB Full Tower', 5, 900.00, 30.00, 40.00, 930.00, 1150.00, '2026-04-30', '', 36),
(139, 'DESK019', 'PC Compacto HTPC', 6, 350.00, 15.00, 20.00, 365.00, 450.00, '2026-04-30', '', 36),
(140, 'DESK020', 'PC Básico Celeron', 12, 200.00, 10.00, 15.00, 210.00, 280.00, '2026-04-30', '', 36);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario_id` int(7) NOT NULL,
  `usuario_nombre` varchar(50) NOT NULL,
  `usuario_apellido` varchar(50) NOT NULL,
  `usuario_email` varchar(50) NOT NULL,
  `usuario_usuario` varchar(30) NOT NULL,
  `usuario_clave` varchar(535) NOT NULL,
  `usuario_foto` varchar(200) NOT NULL,
  `caja_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`) VALUES
(1, 'Administrador', 'Principal', 'jhonatanernesto.henriquez@gmail.com', 'JohnHW', '$2y$10$4VoBSzOHnmbnxl/YSm/vhuNnLrwEB/8VTzL.ugA5jhK8VNrNMDFYm', 'Administrador_89.jpg', 1),
(4, 'Jhonatan Ernesto', 'Henriquez Guevara', 'jhonatanernesto.henrriquez@gmail.com', 'john', '$2y$10$fbhSoL.iqXLDT.2mcIEn0..qJlXSG3K1RMq0dWWbROXxE86NxcmI2', 'Jhonatan_Ernesto_19.jpg', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `venta_id` int(30) NOT NULL,
  `venta_codigo` varchar(200) NOT NULL,
  `venta_fecha` date NOT NULL,
  `venta_hora` varchar(17) NOT NULL,
  `venta_total` decimal(30,2) NOT NULL,
  `venta_pagado` decimal(30,2) NOT NULL,
  `venta_envio` decimal(30,2) NOT NULL DEFAULT 0.00,
  `venta_cambio` decimal(30,2) NOT NULL,
  `usuario_id` int(7) NOT NULL,
  `cliente_id` int(10) NOT NULL,
  `caja_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_id`, `venta_codigo`, `venta_fecha`, `venta_hora`, `venta_total`, `venta_pagado`, `venta_envio`, `venta_cambio`, `usuario_id`, `cliente_id`, `caja_id`) VALUES
(91, 'P0H9B9W1O1-1', '2026-04-30', '10:04 am', 750.00, 750.00, 30.00, 0.00, 1, 44, 1),
(92, 'K3E6D9W0J4-2', '2026-04-30', '10:11 am', 750.00, 750.00, 30.00, 0.00, 1, 46, 1),
(93, 'Y4Q9T6L1G3-3', '2026-04-30', '10:11 am', 750.00, 750.00, 30.00, 0.00, 1, 47, 1),
(94, 'T5M4W6A6K5-4', '2026-04-30', '10:15 am', 750.00, 750.00, 30.00, 0.00, 1, 46, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_detalle`
--

CREATE TABLE `venta_detalle` (
  `venta_detalle_id` int(100) NOT NULL,
  `venta_detalle_cantidad` int(10) NOT NULL,
  `venta_detalle_precio_compra` decimal(30,2) NOT NULL,
  `venta_detalle_precio_venta` decimal(30,2) NOT NULL,
  `venta_detalle_total` decimal(30,2) NOT NULL,
  `venta_detalle_descripcion` varchar(200) NOT NULL,
  `venta_codigo` varchar(200) NOT NULL,
  `producto_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`venta_detalle_id`, `venta_detalle_cantidad`, `venta_detalle_precio_compra`, `venta_detalle_precio_venta`, `venta_detalle_total`, `venta_detalle_descripcion`, `venta_codigo`, `producto_id`) VALUES
(113, 1, 620.00, 750.00, 750.00, 'PC All in One HP 22\"', 'P0H9B9W1O1-1', 128),
(114, 1, 620.00, 750.00, 750.00, 'PC All in One HP 22\"', 'K3E6D9W0J4-2', 128),
(115, 1, 620.00, 750.00, 750.00, 'PC All in One HP 22\"', 'Y4Q9T6L1G3-3', 128),
(116, 1, 620.00, 750.00, 750.00, 'PC All in One HP 22\"', 'T5M4W6A6K5-4', 128);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `caja`
--
ALTER TABLE `caja`
  ADD PRIMARY KEY (`caja_id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`categoria_id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`cliente_id`);

--
-- Indices de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  ADD PRIMARY KEY (`cotizacion_id`);

--
-- Indices de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  ADD PRIMARY KEY (`cotizacion_detalle_id`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`),
  ADD KEY `categoria_id` (`categoria_id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`venta_id`),
  ADD UNIQUE KEY `venta_codigo` (`venta_codigo`),
  ADD KEY `usuario_id` (`usuario_id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `caja_id` (`caja_id`);

--
-- Indices de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD PRIMARY KEY (`venta_detalle_id`),
  ADD KEY `venta_id` (`venta_codigo`),
  ADD KEY `producto_id` (`producto_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `caja`
--
ALTER TABLE `caja`
  MODIFY `caja_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `categoria_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `cotizacion_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  MODIFY `cotizacion_detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `venta_detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=117;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_2` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`categoria_id`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`usuario_id`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`cliente_id`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`caja_id`) REFERENCES `caja` (`caja_id`);

--
-- Filtros para la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  ADD CONSTRAINT `venta_detalle_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `venta_detalle_ibfk_3` FOREIGN KEY (`venta_codigo`) REFERENCES `venta` (`venta_codigo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
