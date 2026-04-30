-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-04-2026 a las 07:11:55
-- Versión del servidor: 12.2.2-MariaDB
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `caja`
--

INSERT INTO `caja` (`caja_id`, `caja_numero`, `caja_nombre`, `caja_efectivo`) VALUES
(1, 1, 'Caja Principal', 861.09);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `categoria_id` int(7) NOT NULL,
  `categoria_nombre` varchar(50) NOT NULL,
  `categoria_ubicacion` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`categoria_id`, `categoria_nombre`, `categoria_ubicacion`) VALUES
(1, 'Microfonos inalambricos', 'Tecnología'),
(2, 'Cases para discos de laptop', 'Tecnología'),
(3, 'Discos duros de laptops', 'Tecnología'),
(4, 'Adaptadores para fuentes de poder', 'Tecnología'),
(5, 'Hubs USB', 'Tecnología'),
(6, 'Caddys DVD para segundo disco laptops', 'Tecnología'),
(7, 'Targetas de expanción PCI', 'Tecnología'),
(8, 'Adaptadores y cases para discos duros PC', 'Tecnología'),
(9, 'Enclousures para M2', 'Tecnología'),
(10, 'Discos duros externos', 'Tecnología'),
(11, 'Memorias RAM DDR3 de laptops', 'Tecnología'),
(12, 'Pulseras antiestatica', 'Tecnología'),
(13, 'Baterias portables', 'Tecnología'),
(14, 'Memorias RAM DDR3 de PC', 'Tecnología'),
(15, 'Memorias RAM DDR4 de PC', 'Tecnología'),
(16, 'Discos SSD SATA III', 'Tecnología'),
(17, 'Audifonos Inalambricos', 'Tecnología'),
(18, 'Repetidores WIFI', 'Tecnología'),
(19, 'Discos M2 MVME Genericos', 'Tecnología'),
(20, 'Item Envio', 'Delivery'),
(21, 'COMPUTADORAS DE ESCRITORIO  SOLO CPU', 'Tecnología'),
(22, 'Cables o Adaptadores De Carga o Datos', 'Tecnología'),
(23, 'Kits Reprogramadores para Chips EEPROM y BIOS', 'Tecnología'),
(24, 'Kits de Arduino o Electronica Basica', 'Tecnología'),
(25, 'Kits Destornilladores', 'Tecnología'),
(26, 'Cables o Adaptadores de Video', 'Tecnología'),
(27, 'Adaptadores de RED con puertos de video y USB', 'Tecnología'),
(28, 'ThermalPads Pastas Termicas y otros componentes', 'Tecnología'),
(29, 'Componentes electronicos y Arduino por separado', 'Tecnología'),
(30, 'Cables y probadores de RED', 'Tecnología'),
(31, 'Llaveros Monederos Stickers Cajas Bolsitas y más', 'Accesorios'),
(32, 'Joysticks para reparacion de control PS4', 'Tecnología'),
(33, 'MEMORIAS RAM DDR4 LAPTOPS', 'Tecnología'),
(34, 'DISCOS DURO PARA PC DE ESCRITORIO', 'Tecnología');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`cliente_id`, `cliente_tipo_documento`, `cliente_numero_documento`, `cliente_nombre`, `cliente_apellido`, `cliente_provincia`, `cliente_ciudad`, `cliente_direccion`, `cliente_telefono`, `cliente_email`, `cliente_key`) VALUES
(43, 'Otro', '1238079100', 'Prueba', 'Prueba', 'San Miguel', 'San Miguel', 'San Miguel', '21212828', 'jhonatanernesto.henrriquez@gmail.com', 're_eGYkCkBZ_Aj3JUFZLZTdbWRDxp1vepCHy'),
(44, 'Otro', '4722601956', 'Elvis', 'Wolsvaldo', 'La Union', 'El Sauce', 'Casa', '78692415', 'rubioelvis45@gmail.com', ''),
(45, 'Otro', '2879766330', 'Katy', 'Yamileth', 'San Miguel', 'San Miguel', 'Barrio San Micolas', '21212828', 'renderosyamileth8@gmail.com', 're_bXvZgD4p_58k4y6iiKUHsVo1L7QCVcBQD'),
(46, 'Otro', '7338688691', 'Jhonatan', 'Henríquez', 'San Miguel', 'San Miguel', 'Local', '25252626', 'jhonatanernesto.henriquez@gmail.com', 're_dM749gai_8XWFfXegioRaQNmRNymKSEDE'),
(47, 'Otro', '3019655807', 'Elvis', 'UNAB', 'San Miguel', 'San Miguel', 'Local', '24242626', 'rm0796042022@unab.edu.sv', '');

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
  `cotizacion_estado` varchar(20) NOT NULL DEFAULT 'pendiente',
  `usuario_id` int(7) NOT NULL,
  `cliente_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `cotizacion`
--

INSERT INTO `cotizacion` (`cotizacion_id`, `cotizacion_codigo`, `cotizacion_fecha`, `cotizacion_hora`, `cotizacion_total`, `cotizacion_envio`, `cotizacion_estado`, `usuario_id`, `cliente_id`) VALUES
(1, 'R2D4G6Z7L3-1', '2026-04-27', '11:21 pm', 25.01, 0.00, 'pendiente', 1, 43);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cotizacion_detalle`
--

CREATE TABLE `cotizacion_detalle` (
  `cotizacion_detalle_id` int(100) NOT NULL,
  `cotizacion_detalle_cantidad` int(10) NOT NULL,
  `cotizacion_detalle_precio` decimal(30,2) NOT NULL,
  `cotizacion_detalle_total` decimal(30,2) NOT NULL,
  `cotizacion_detalle_descripcion` varchar(200) NOT NULL,
  `cotizacion_codigo` varchar(200) NOT NULL,
  `producto_id` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

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
  `categoria_id` int(7) NOT NULL,
  `producto_descripcion` text NOT NULL DEFAULT 'Descripción no disponible',
  `producto_estado` enum('disponible','no_disponible') DEFAULT 'disponible'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`producto_id`, `producto_codigo`, `producto_nombre`, `producto_stock_total`, `producto_costo_compra`, `producto_costo_envio`, `producto_envio_venta`, `producto_costo_unidad`, `producto_precio_vender`, `producto_fecha_ingresado`, `producto_foto`, `categoria_id`, `producto_descripcion`, `producto_estado`) VALUES
(3, 'PVYV6DQT7W', 'Discos duros 1TB laptops', 1, 26.00, 0.00, 0.00, 26.00, 45.00, '2026-04-10', 'PVYV6DQT7W_45.jpg', 3, 'Descripción no disponible', 'disponible'),
(4, 'WGDFI9VX4I', 'Cases para discos de laptop', 0, 10.90, 0.00, 0.00, 3.63, 15.00, '2026-03-17', 'WGDFI9VX4I_28.png', 2, 'Descripción no disponible', 'disponible'),
(5, '9YESLOB97C', 'Disco duro 500GB de laptops', 1, 11.67, 0.00, 0.00, 5.83, 18.00, '2026-03-17', '9YESLOB97C_45.jpg', 3, 'Descripción no disponible', 'disponible'),
(6, 'NFDLE9FM4B', 'Caddy DVD para segundo disco laptops', 4, 28.54, 0.00, 0.00, 3.17, 15.00, '2026-03-17', 'NFDLE9FM4B_77.png', 6, 'Descripción no disponible', 'disponible'),
(8, '2UQE88EJAM', 'Adaptador para discos HDD 3.5 - Fuente de poder 12v', 4, 38.78, 0.00, 0.00, 9.69, 20.00, '2026-03-17', '2UQE88EJAM_40.png', 8, 'Descripción no disponible', 'disponible'),
(9, 'Y5W4VA7B8U', 'Adaptador ATX 24 pines a 8 pines DELL', 5, 21.55, 0.00, 0.00, 4.31, 20.00, '2026-03-17', 'Y5W4VA7B8U_30.png', 4, 'Descripción no disponible', 'disponible'),
(10, 'UO98G983VU', 'Adaptador ATX 24 pines a 24 pines mini', 4, 10.00, 0.00, 0.00, 2.50, 10.00, '2026-03-17', 'UO98G983VU_7.png', 4, 'hols', 'no_disponible'),
(11, 'HHN7IFWV0H', 'Adaptador ATX 24 pines a 6 pines HP', 5, 26.11, 5.35, 0.00, 6.29, 20.00, '2026-03-17', 'HHN7IFWV0H_45.png', 4, 'Descripción no disponible', 'disponible'),
(12, 'E0BNL6V2DV', 'Microfonos inalambricos tipo C 2 en 1', 3, 30.00, 0.00, 0.00, 7.50, 18.00, '2026-03-17', 'E0BNL6V2DV_62.png', 1, 'Descripción no disponible', 'disponible'),
(14, 'RJ0OKFFEQV', 'Adaptador de cargador USB 3.0 - USB A MACHO A USB C HEMBRA', 18, 7.38, 0.00, 0.00, 0.41, 5.00, '2026-03-17', 'RJ0OKFFEQV_87.jpg', 5, 'Descripción no disponible', 'disponible'),
(16, '0CI0PHVISD', 'Adaptador Olaf OTG tipo c a Lightning para iphone Lightning macho a USB C hembra tipo c adaptador pa', 6, 16.10, 0.00, 0.00, 2.30, 5.00, '2026-03-17', '0CI0PHVISD_10.png', 5, 'Descripción no disponible', 'disponible'),
(17, 'N006FQI5IK', 'Carcasa de disco duro externo de Metal sólido USB3.1 M.2 SATA SSD MVME', 2, 29.29, 10.33, 0.00, 7.92, 20.00, '2026-03-17', 'N006FQI5IK_66.png', 9, 'Descripción no disponible', 'disponible'),
(18, 'V3IWDKS1CB', 'Funda M.2 SSD para 2230 2242 2260 2280 NGFF 5Gbps SATA caja de disco duro tipo C USB transparente SS', 1, 6.40, 0.00, 0.00, 6.40, 20.00, '2026-03-17', 'V3IWDKS1CB_0.png', 9, 'Descripción no disponible', 'disponible'),
(20, 'YAZNBHY7QU', 'Lector de tarjetas de memoria multifunción 5 en 1, USB 3,0 tipo C, Micro USB, SD, TF, para Android,', 4, 9.64, 0.00, 0.00, 2.41, 5.00, '2026-03-17', 'YAZNBHY7QU_19.png', 5, 'Descripción no disponible', 'disponible'),
(22, '4S1OM7C2W9', 'Memorias DDR3L 8GB 1600 1.35V', 3, 19.50, 0.00, 0.00, 6.50, 35.00, '2026-03-17', '4S1OM7C2W9_84.png', 11, 'Descripción no disponible', 'disponible'),
(29, 'SSD0UDX33N', 'Memorias RAM 2GB DDR3 10600', 1, 0.01, 0.00, 0.00, 0.01, 10.00, '2026-03-17', 'SSD0UDX33N_84.jpg', 14, 'Descripción no disponible', 'disponible'),
(30, 'Z8I170LZD0', 'Memorias RAM 4GB DDR4 17000P', 1, 0.01, 0.00, 0.00, 0.01, 25.00, '2024-09-01', 'Z8I170LZD0_79.jpg', 15, 'Descripción no disponible', 'disponible'),
(35, 'U3TU5UBEEL', 'Memorias DDR3L 4GB 1600 1.35V', 1, 0.01, 0.00, 0.00, 20.00, 20.00, '2026-03-17', 'U3TU5UBEEL_63.png', 11, 'Descripción no disponible', 'disponible'),
(37, 'HZ702ZP06U', 'REPETIDOR WIFI 2.4 GHZ', 10, 59.55, 5.35, 0.00, 6.49, 16.00, '2026-03-17', 'HZ702ZP06U_66.png', 18, 'Descripción no disponible', 'disponible'),
(41, 'TD730CJVTQ', 'Envio C807 Xpress $5', 89, 0.01, 0.00, 0.00, 0.01, 5.01, '2025-01-01', 'TD730CJVTQ_87.jpg', 20, 'Descripción no disponible', 'disponible'),
(42, 'MRUM46VTSJ', 'Envio C807 Xpress $1', 98, 0.01, 0.00, 0.00, 0.01, 1.01, '2025-01-01', 'MRUM46VTSJ_77.jpg', 20, 'Descripción no disponible', 'disponible'),
(43, 'PZ7TP8FDJ8', 'Envio C807 Xpress $4', 98, 0.01, 0.00, 0.00, 0.01, 4.01, '2025-02-19', 'PZ7TP8FDJ8_37.jpg', 20, 'Descripción no disponible', 'disponible'),
(44, '3LRHNR6QHV', 'Discos duros 320GB laptops', 1, 11.00, 0.00, 0.00, 11.00, 11.00, '2026-03-17', '3LRHNR6QHV_89.jpg', 3, 'Descripción no disponible', 'disponible'),
(47, 'SVB9IBQM2G', 'CPU DELL OPTIPLEX 9020 SFF INTEL CORE I5 4TH GEN 8GB DE RAM 120GB SSD Y CABLE DE PODER', 1, 50.00, 0.00, 0.00, 50.00, 130.00, '2026-03-17', 'SVB9IBQM2G_95.png', 21, 'Descripción no disponible', 'disponible'),
(48, '2BQ3IVPO6F', 'Adaptador OTG Tipo C para conectar memorias', 24, 10.25, 0.00, 0.00, 0.41, 5.00, '2026-03-17', '2BQ3IVPO6F_7.jpg', 5, 'Descripción no disponible', 'disponible'),
(49, '8URR17BF7X', 'RAM DDR4 PC4 8GB 2666MHZ NUEVA', 2, 0.01, 0.00, 0.00, 0.01, 45.00, '2026-03-17', '8URR17BF7X_82.jpg', 15, 'Descripción no disponible', 'disponible'),
(50, 'O9XSVP2FA2', 'CABLES 50CM USB PARA CASE DE DISCO', 7, 15.69, 0.00, 0.00, 2.24, 6.00, '2026-03-17', 'O9XSVP2FA2_88.jpg', 22, 'Descripción no disponible', 'disponible'),
(51, 'KVWMN4NTOX', 'KITS REPROGRAMADOR PARA BIOS', 4, 62.52, 0.00, 0.00, 10.42, 20.00, '2026-03-17', 'KVWMN4NTOX_26.jpg', 23, 'Descripción no disponible', 'disponible'),
(52, 'LJI4YBB7EO', 'ADAPTADORES PARA CARGADOR DELL PUNTA GRUESA A DELGADA', 20, 20.58, 0.00, 0.00, 5.00, 5.00, '2026-03-17', 'LJI4YBB7EO_11.jpg', 22, 'Descripción no disponible', 'disponible'),
(53, 'NWB6W9JYAS', 'KIT DESARMADORES 115 en 1', 2, 0.01, 0.00, 0.00, 0.01, 15.00, '2026-03-17', 'NWB6W9JYAS_51.jpg', 25, 'Descripción no disponible', 'disponible'),
(54, 'YBA02WINL8', 'Adaptador TIpo C a HDMI solo GRIS', 2, 8.73, 0.00, 0.00, 4.36, 10.00, '2026-03-17', 'YBA02WINL8_50.jpg', 26, 'Descripción no disponible', 'disponible'),
(55, 'GAETWHMJUO', 'ADAPTADOR TIPO C A HDMI CON USB A Y USB C', 6, 21.33, 0.00, 0.00, 3.55, 12.00, '2026-03-17', 'GAETWHMJUO_15.jpg', 26, 'Descripción no disponible', 'disponible'),
(56, '3ARP1K2DD4', 'Divisor HDMI 4K de 3 entradas y 1 salida, Selector de conmutador HDMI de 3 puertos con cable HDMI', 1, 0.01, 0.00, 0.00, 0.01, 15.00, '2026-03-17', '3ARP1K2DD4_8.jpg', 26, 'Descripción no disponible', 'disponible'),
(57, '7Q1HDOE80I', 'Adaptador de cable de 1.8 metros de alta definición de DP a HDTV', 3, 11.53, 0.00, 0.00, 3.84, 10.00, '2026-03-17', '7Q1HDOE80I_84.jpg', 26, 'Descripción no disponible', 'disponible'),
(58, '2B3DHJPFZ7', 'Adaptador de tarjeta de red LAN USB 2.0 a Ethernet, Adaptador de tarjeta de red de 100 Mbps', 4, 15.37, 0.00, 0.00, 3.84, 8.00, '2026-03-17', '2B3DHJPFZ7_78.jpg', 27, 'Descripción no disponible', 'disponible'),
(59, 'T9PUSDBT6R', 'Conversor de DisplayPort a HDTV adaptador pieza, Adaptador de DisplayPort a HDTV compatible con 4K 1', 6, 14.99, 0.00, 0.00, 2.50, 8.00, '2026-03-17', 'T9PUSDBT6R_2.jpg', 26, 'Descripción no disponible', 'disponible'),
(60, 'DVDWJSBWKG', 'Juego de Componentes Electrónicos Comunes con Diodo e Interruptor Giratorio, Incluye Módulo de Ali', 12, 137.09, 0.00, 0.00, 11.42, 25.00, '2026-04-03', 'DVDWJSBWKG_19.jpg', 24, 'Descripción no disponible', 'disponible'),
(61, 'LX0XP2Y0RO', 'Cases para disco transparentes USB tipo C y USB micro B', 1, 29.10, 0.00, 0.00, 4.85, 15.00, '2026-03-21', 'LX0XP2Y0RO_50.jpg', 2, 'Descripción no disponible', 'disponible'),
(62, 'XU1HCHZP1K', 'Adaptador conversor de Tipo C a HDTV y VGA, transmisor de señal de video para computadora', 4, 39.46, 0.00, 0.00, 9.87, 15.00, '2026-03-21', 'XU1HCHZP1K_16.jpg', 26, 'Descripción no disponible', 'disponible'),
(63, '8KZ5EOBO5T', 'Kit Básico de Inicio DIY para Placa Uno R3 con Breadboard de 830 Agujeros Resistores y Kit de Apren', 7, 88.70, 0.00, 0.00, 12.67, 30.00, '2026-04-03', '8KZ5EOBO5T_1.jpg', 24, 'Descripción no disponible', 'disponible'),
(64, '3PU2UVBXWL', 'ADAPTADORES PARA CARGADOR HP PUNTA DELGADA AZUL, DE PUNTA GRUESA', 19, 21.09, 0.00, 0.00, 1.05, 5.00, '2026-03-21', '3PU2UVBXWL_22.jpg', 22, 'Descripción no disponible', 'disponible'),
(65, 'WWGVHXSDDC', 'Paquete de 100 almohadillas de silicona conductoras térmicas JEYI almohadilla térmica M.2 SSD NVMe', 1, 15.62, 0.00, 0.00, 7.81, 20.00, '2026-03-21', 'WWGVHXSDDC_18.jpg', 28, 'Descripción no disponible', 'disponible'),
(66, 'GOFCBIBDSH', 'HUB USB 8 EN 1 USB, USB A, USB C, JACK DE AUDIO', 4, 24.24, 0.00, 0.00, 6.06, 15.00, '2026-03-21', 'GOFCBIBDSH_88.jpg', 5, 'Descripción no disponible', 'disponible'),
(68, 'DA75YJ5S88', 'Cable de alimentación de 24 pines a 6 pines, para del OptiPlex serie 5000', 5, 40.51, 5.35, 0.00, 7.64, 16.00, '2026-03-21', 'DA75YJ5S88_62.jpg', 4, 'Descripción no disponible', 'disponible'),
(69, '2J1M4NWOHD', 'M.2 MVME 22X30 128GB', 1, 0.01, 0.00, 0.00, 0.01, 15.00, '2026-03-21', '2J1M4NWOHD_46.jpg', 19, 'Descripción no disponible', 'disponible'),
(70, 'IPF67WZ9DK', 'MEMORIA RAM DDR4 16GB 3200MHZ', 2, 0.01, 0.00, 0.00, 0.01, 125.00, '2026-03-22', 'IPF67WZ9DK_43.jpg', 15, 'Descripción no disponible', 'disponible'),
(71, '4OKJXWWTF4', 'CABLE VGA ESTANDAR', 1, 0.01, 0.00, 0.00, 0.01, 5.00, '2026-03-22', '4OKJXWWTF4_49.jpg', 26, 'Descripción no disponible', 'disponible'),
(72, '34WL0CRSTA', 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 1, 28.76, 0.00, 0.00, 3.60, 10.00, '2026-03-22', '34WL0CRSTA_47.jpg', 26, 'Descripción no disponible', 'disponible'),
(73, 'P82ISUC4ZN', 'MICRO SERVO SG90', 11, 15.75, 0.00, 0.00, 1.31, 5.00, '2026-03-22', 'P82ISUC4ZN_79.jpg', 29, 'Descripción no disponible', 'disponible'),
(74, '68DRQDS4X6', 'CABLE MINI DP A HDMI', 2, 3.98, 5.35, 0.00, 4.67, 10.00, '2026-03-22', '68DRQDS4X6_43.jpg', 26, 'Descripción no disponible', 'disponible'),
(75, 'TFFSDR5Y0B', 'PROBADOR DE CABLES DE RED RJ45 Y RJ11', 4, 19.24, 0.00, 0.00, 4.81, 10.00, '2026-03-22', 'TFFSDR5Y0B_84.jpg', 30, 'Descripción no disponible', 'disponible'),
(76, 'MU09IJ48IG', 'Mini Monedero Colgante, Bolsa de Almacenamiento Ligera para Llaves y Auriculares, Llavero Monedero p', 3, 17.60, 0.00, 0.00, 5.87, 10.00, '2026-03-22', 'MU09IJ48IG_34.jpg', 31, 'Descripción no disponible', 'disponible'),
(77, 'I1Y14HDBUV', 'Cable USB-A a USB-B 2.0 negro, ideal para impresoras o discos duros externos, con conectividad de al', 4, 11.56, 0.00, 0.00, 2.89, 6.00, '2026-03-22', 'I1Y14HDBUV_64.jpg', 22, 'Descripción no disponible', 'disponible'),
(78, 'K65CN7PUKJ', 'CASES EAGET PARA M.2 SATA Y MVME DOBLE PROTOCOLO', 4, 60.44, 0.00, 0.00, 15.11, 25.00, '2026-03-22', 'K65CN7PUKJ_95.jpg', 9, 'Descripción no disponible', 'disponible'),
(79, 'SKYSBQ29Q2', 'Adaptador TIPO-C a ETHERNET 3.0', 1, 3.29, 0.00, 0.00, 3.29, 10.00, '2026-03-22', 'SKYSBQ29Q2_14.jpg', 30, 'Descripción no disponible', 'disponible'),
(80, 'MF9WMEQ0LW', 'Estación de Acoplamiento USB-C 6-en-1 con Entrada PD de 100W, Puerto Ethernet RJ45 de 100Mbps', 1, 5.79, 0.00, 0.00, 5.79, 15.00, '2026-03-22', 'MF9WMEQ0LW_54.jpg', 5, 'Descripción no disponible', 'disponible'),
(81, 'ZEURJGUH28', 'Adaptador Dock HUB 5 en 1 para HDTV RJ45 USB3.0 PD Tipo-C, Compatible con Mac y PC Windows y BOLSITA', 1, 5.46, 0.00, 0.00, 5.46, 16.00, '2026-03-22', 'ZEURJGUH28_38.jpg', 5, 'Descripción no disponible', 'disponible'),
(82, 'IR3NGZK2TQ', 'Hub USB-C Multifunción con 8 Puertos, Soporte para Salida HDTV 4K, Puerto RJ45 de 3937.01 Pulgadas,', 0, 2.36, 0.00, 0.00, 2.36, 15.00, '2026-03-22', 'IR3NGZK2TQ_14.jpg', 5, 'Descripción no disponible', 'disponible'),
(83, '1G2ZT3F1QB', 'Placa de pruebas de 830 pines sin soldadura - Una placa de prototipado versátil con 4 rieles', 11, 21.77, 0.00, 0.00, 1.97, 10.00, '2026-04-04', '1G2ZT3F1QB_58.jpg', 29, 'Descripción no disponible', 'disponible'),
(84, 'NWHYYK4YNS', 'El Kit de Inicio Electrónico para el Set Arduino Uno R3 Incluye una Placa de Pruebas, LEDs  SIN CA', 2, 17.76, 0.00, 0.00, 8.88, 25.00, '2026-03-22', 'NWHYYK4YNS_93.jpg', 24, 'Descripción no disponible', 'disponible'),
(85, 'JATS33KCPK', 'Placas Arduinos Uno R3', 9, 29.54, 0.00, 0.00, 3.28, 16.00, '2026-04-03', 'JATS33KCPK_45.jpg', 29, 'Descripción no disponible', 'disponible'),
(86, 'RSDDO1D46L', 'Módulo Sensor Analógico Joystick Rocker 3D de Repuesto Potenciómetro para Ps4 /pro Slim,', 10, 7.19, 0.00, 0.00, 0.72, 5.00, '2026-03-22', 'RSDDO1D46L_31.jpg', 32, 'Descripción no disponible', 'disponible'),
(87, 'KBNJEM40VH', 'Kit de Surtido Básico de Componentes Electrónicos de 1400 piezas, Condensador', 1, 10.00, 0.00, 0.00, 10.00, 35.00, '2026-03-22', 'KBNJEM40VH_91.jpg', 24, 'Descripción no disponible', 'disponible'),
(88, 'PL3FTGMTXG', 'DISCO DURO DE 500GB NUEVO CON FUNDA US', 0, 22.54, 0.00, 0.00, 22.54, 45.00, '2026-03-22', 'PL3FTGMTXG_61.jpg', 10, 'Descripción no disponible', 'disponible'),
(89, '2DQQKBAVRN', 'Alfombra de silicona para tecnicos 45X30', 3, 38.79, 6.06, 0.00, 14.95, 35.00, '2026-03-22', '2DQQKBAVRN_39.jpg', 25, 'Descripción no disponible', 'disponible'),
(90, 'VB0AP01LIY', 'Almohadilla de silicona resistente a altas temperaturas 35x24', 4, 30.28, 0.00, 0.00, 7.57, 25.00, '2026-03-22', 'VB0AP01LIY_31.jpg', 25, 'Descripción no disponible', 'disponible'),
(91, 'WDCR94A904', 'CUBOS DE CARGA RAPIDA 30W', 7, 13.72, 0.00, 0.00, 1.96, 11.00, '2026-03-22', 'WDCR94A904_26.jpg', 22, 'Descripción no disponible', 'disponible'),
(92, 'Z8KI2P8U2L', 'CABLE TIPO C A TIPO C PARA CARGADOR', 8, 14.24, 0.00, 0.00, 1.78, 6.00, '2026-03-22', 'Z8KI2P8U2L_45.jpg', 22, 'Descripción no disponible', 'disponible'),
(93, 'N01WFK2Q30', 'CABLE LIGTHNING PARA IPHONE CARGA RAPIDA', 10, 19.63, 0.00, 0.00, 1.96, 6.00, '2026-03-22', 'N01WFK2Q30_96.jpg', 22, 'Descripción no disponible', 'disponible'),
(94, '9DTA2FEJS1', 'MEMORIAS RAM DDR4 2133MHZ LAPTOPS', 2, 0.01, 0.00, 0.00, 0.01, 45.00, '2026-03-23', '9DTA2FEJS1_61.jpg', 33, 'Descripción no disponible', 'disponible'),
(95, 'HJQB0YVLRO', 'DISCO DURO 500GB 3.5 PC DESKTOPS', 1, 0.01, 0.00, 0.00, 0.01, 15.00, '2026-03-23', 'HJQB0YVLRO_72.jpg', 34, 'Descripción no disponible', 'disponible'),
(96, 'RAFHTW0G97', 'Kit de componentes electrónicos de 1628 piezas edición definitiva para bricolaje con diodos LED de', 1, 12.77, 0.00, 0.00, 12.77, 45.00, '2026-03-23', 'RAFHTW0G97_62.jpg', 24, 'Descripción no disponible', 'disponible'),
(97, 'CZP9S6HINA', 'Sensor Ultrasonico para Arduino', 0, 0.62, 0.00, 0.00, 0.62, 5.00, '2026-03-20', 'CZP9S6HINA_86.jpg', 29, 'Descripción no disponible', 'disponible'),
(98, 'KEJDBY2068', 'Kits de sensores para arduino 22 en 1', 1, 13.75, 0.00, 0.00, 13.75, 30.00, '2026-04-04', 'KEJDBY2068_41.png', 24, 'Descripción no disponible', 'disponible'),
(99, '4VPNVA3J2L', 'HY510 pasta de grasa de silicona conductora térmica para GPU CPU Chipset refrigeración', 19, 43.96, 5.00, 0.00, 2.45, 15.00, '2026-04-10', '4VPNVA3J2L_51.jpg', 28, 'Descripción no disponible', 'disponible'),
(100, 'ZOVCCQD5NN', 'Pasta térmica Grizzly Kryonaut Extreme KE para enfriador de CPU/GPU grasa de silicona de refrigerac', 10, 24.33, 2.50, 0.00, 2.68, 15.00, '2026-04-10', 'ZOVCCQD5NN_53.jpg', 28, 'Descripción no disponible', 'disponible');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario_id`, `usuario_nombre`, `usuario_apellido`, `usuario_email`, `usuario_usuario`, `usuario_clave`, `usuario_foto`, `caja_id`) VALUES
(1, 'Administrador', 'Principal', 'jhonatanernesto.henriquez@gmail.com', 'admin001', '$2y$10$/6q5PKCPUpw71QAzGNyyjO8bCGFHPdQWArNGAcn63.WPBUdYTSINe', 'Administrador_89.jpg', 1),
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
  `caja_id` int(5) NOT NULL,
  `tipo` enum('venta','cotizacion') DEFAULT 'venta'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `venta`
--

INSERT INTO `venta` (`venta_id`, `venta_codigo`, `venta_fecha`, `venta_hora`, `venta_total`, `venta_pagado`, `venta_envio`, `venta_cambio`, `usuario_id`, `cliente_id`, `caja_id`, `tipo`) VALUES
(85, 'J8T2H7R1W8-1', '2026-04-27', '09:24 pm', 30.00, 30.00, 0.00, 0.00, 1, 43, 1, 'venta'),
(86, 'H7B2V2L9B5-2', '2026-04-27', '09:35 pm', 15.00, 20.00, 0.00, 5.00, 1, 43, 1, 'venta'),
(87, 'R1H1Z4U2E5-3', '2026-04-29', '08:57 pm', 20.00, 20.00, 0.00, 0.00, 1, 44, 1, 'venta'),
(88, 'L8G9Z7U3A0-4', '2026-04-29', '08:58 pm', 5.01, 5.01, 0.00, 0.00, 1, 43, 1, 'venta'),
(89, 'K1O6B5N2S6-5', '2026-04-29', '09:16 pm', 15.00, 15.00, 0.00, 0.00, 1, 43, 1, 'venta'),
(90, 'I9L9C8Z7P1-6', '2026-04-29', '09:20 pm', 20.00, 20.00, 0.00, 0.00, 1, 44, 1, 'venta'),
(91, 'R3E9A7B4M3-7', '2026-04-29', '09:27 pm', 10.00, 10.00, 0.00, 0.00, 1, 45, 1, 'venta'),
(92, 'S2T2W5F9M7-8', '2026-04-29', '09:30 pm', 10.00, 10.00, 0.00, 0.00, 1, 43, 1, 'venta'),
(93, 'E3T0Q1J6N1-9', '2026-04-29', '09:31 pm', 10.00, 10.00, 0.00, 0.00, 1, 43, 1, 'venta'),
(94, 'V8W3J4C5I1-10', '2026-04-29', '09:35 pm', 10.00, 10.00, 0.00, 0.00, 1, 43, 1, 'venta'),
(95, 'I1N8L6R6T7-11', '2026-04-29', '09:37 pm', 10.00, 10.00, 0.00, 0.00, 1, 46, 1, 'venta'),
(96, 'H3U8W9T2R1-12', '2026-04-29', '09:41 pm', 10.00, 10.00, 0.00, 0.00, 1, 46, 1, 'venta'),
(97, 'W3N3D5U8I6-13', '2026-04-29', '09:55 pm', 15.00, 15.00, 0.00, 0.00, 1, 45, 1, 'venta'),
(98, 'F1R4U8A6O2-14', '2026-04-29', '10:07 pm', 15.00, 15.00, 0.00, 0.00, 1, 45, 1, 'venta'),
(99, 'H5D4F3T9G9-15', '2026-04-29', '10:16 pm', 15.00, 15.00, 0.00, 0.00, 1, 43, 1, 'venta'),
(100, 'V4N2B6L9X0-16', '2026-04-29', '10:17 pm', 5.01, 5.01, 0.00, 0.00, 1, 46, 1, 'venta'),
(101, 'H5Z1T2N9I7-17', '2026-04-29', '10:28 pm', 10.00, 15.00, 0.00, 5.00, 1, 45, 1, 'venta'),
(102, 'M6C1S6P6J8-18', '2026-04-29', '10:46 pm', 15.00, 15.00, 0.00, 0.00, 1, 43, 1, 'venta'),
(103, 'P7B3S2Z8N2-19', '2026-04-29', '10:54 pm', 15.00, 15.00, 0.00, 0.00, 1, 45, 1, 'venta'),
(104, 'G5A6R0S9L3-20', '2026-04-29', '11:04 pm', 20.00, 20.00, 0.00, 0.00, 1, 46, 1, 'venta'),
(105, 'F0Y8C0M7L5-21', '2026-04-29', '11:05 pm', 15.00, 15.00, 0.00, 0.00, 1, 43, 1, 'venta');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Volcado de datos para la tabla `venta_detalle`
--

INSERT INTO `venta_detalle` (`venta_detalle_id`, `venta_detalle_cantidad`, `venta_detalle_precio_compra`, `venta_detalle_precio_venta`, `venta_detalle_total`, `venta_detalle_descripcion`, `venta_codigo`, `producto_id`) VALUES
(106, 2, 3.63, 15.00, 30.00, 'Cases para discos de laptop', 'J8T2H7R1W8-1', 4),
(107, 1, 3.17, 15.00, 15.00, 'Caddy DVD para segundo disco laptops', 'H7B2V2L9B5-2', 6),
(108, 1, 7.92, 20.00, 20.00, 'Carcasa de disco duro externo de Metal sólido USB3.1 M.2 SATA SSD MVME', 'R1H1Z4U2E5-3', 17),
(109, 1, 0.01, 5.01, 5.01, 'Envio C807 Xpress $5', 'L8G9Z7U3A0-4', 41),
(110, 1, 3.17, 15.00, 15.00, 'Caddy DVD para segundo disco laptops', 'K1O6B5N2S6-5', 6),
(111, 1, 7.92, 20.00, 20.00, 'Carcasa de disco duro externo de Metal sólido USB3.1 M.2 SATA SSD MVME', 'I9L9C8Z7P1-6', 17),
(112, 1, 3.60, 10.00, 10.00, 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 'R3E9A7B4M3-7', 72),
(113, 1, 3.60, 10.00, 10.00, 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 'S2T2W5F9M7-8', 72),
(114, 1, 3.60, 10.00, 10.00, 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 'E3T0Q1J6N1-9', 72),
(115, 1, 3.60, 10.00, 10.00, 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 'V8W3J4C5I1-10', 72),
(116, 1, 3.60, 10.00, 10.00, 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 'I1N8L6R6T7-11', 72),
(117, 1, 3.60, 10.00, 10.00, 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 'H3U8W9T2R1-12', 72),
(118, 1, 4.85, 15.00, 15.00, 'Cases para disco transparentes USB tipo C y USB micro B', 'W3N3D5U8I6-13', 61),
(119, 1, 3.17, 15.00, 15.00, 'Caddy DVD para segundo disco laptops', 'F1R4U8A6O2-14', 6),
(120, 1, 3.17, 15.00, 15.00, 'Caddy DVD para segundo disco laptops', 'H5D4F3T9G9-15', 6),
(121, 1, 0.01, 5.01, 5.01, 'Envio C807 Xpress $5', 'V4N2B6L9X0-16', 41),
(122, 1, 3.60, 10.00, 10.00, 'ADAPTADORES HDMI A VGA CON JACK DE AUDIO', 'H5Z1T2N9I7-17', 72),
(123, 1, 3.17, 15.00, 15.00, 'Caddy DVD para segundo disco laptops', 'M6C1S6P6J8-18', 6),
(124, 1, 4.85, 15.00, 15.00, 'Cases para disco transparentes USB tipo C y USB micro B', 'P7B3S2Z8N2-19', 61),
(125, 1, 7.92, 20.00, 20.00, 'Carcasa de disco duro externo de Metal sólido USB3.1 M.2 SATA SSD MVME', 'G5A6R0S9L3-20', 17),
(126, 1, 4.85, 15.00, 15.00, 'Cases para disco transparentes USB tipo C y USB micro B', 'F0Y8C0M7L5-21', 61);

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
  MODIFY `categoria_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `cliente_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de la tabla `cotizacion`
--
ALTER TABLE `cotizacion`
  MODIFY `cotizacion_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `cotizacion_detalle`
--
ALTER TABLE `cotizacion_detalle`
  MODIFY `cotizacion_detalle_id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `usuario_id` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `venta_id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT de la tabla `venta_detalle`
--
ALTER TABLE `venta_detalle`
  MODIFY `venta_detalle_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

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
