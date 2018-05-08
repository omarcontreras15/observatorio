-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-04-2018 a las 14:34:12
-- Versión del servidor: 10.1.29-MariaDB
-- Versión de PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `observatorio`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formulario_recepcion_informacion`
--

CREATE TABLE `formulario_recepcion_informacion` (
  `id` int(11) NOT NULL,
  `usuario` varchar(255) NOT NULL,
  `fecha_declaracion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `zona_declaracion` varchar(10) NOT NULL,
  `codigo_dane` int(11) NOT NULL,
  `municipio_declaracion` varchar(255) NOT NULL,
  `entidad_denuncia` varchar(255) NOT NULL,
  `hecho` varchar(255) NOT NULL,
  `tipo_accion` text NOT NULL,
  `fecha_ocurrencia` date NOT NULL,
  `municipio_ocurrencia` int(11) NOT NULL,
  `zona_ocurrencia` varchar(10) NOT NULL,
  `lugar_ocurrencia` text NOT NULL,
  `ubicacion_ocurrencia` varchar(100) NOT NULL,
  `arma_medio` varchar(100) NOT NULL,
  `causa` varchar(255) NOT NULL,
  `nombre_ubicacion_ocurrencia` text NOT NULL,
  `tipo_documento_victima` varchar(100) NOT NULL,
  `fecha_nacimiento_victima` date NOT NULL,
  `edad_victima` int(11) NOT NULL,
  `ciclo_vida_victima` varchar(100) NOT NULL,
  `pais_nacimiento_victima` varchar(100) NOT NULL,
  `ciudad_nacimiento_victima` varchar(255) NOT NULL,
  `pais_residencia_victima` varchar(100) NOT NULL,
  `ciudad_residencia_victima` varchar(255) NOT NULL,
  `genero_victima` varchar(150) NOT NULL,
  `pertenencia_etnica_victima` varchar(150) NOT NULL,
  `resguardo_victima` varchar(255) NOT NULL,
  `etnia_victima` varchar(255) NOT NULL,
  `discapacidad_victima` varchar(150) NOT NULL,
  `descripcion_discapacidad_victima` text NOT NULL,
  `presunto_autor` varchar(255) NOT NULL,
  `genero_autor` varchar(150) NOT NULL,
  `relacion_victima` varchar(100) NOT NULL,
  `pertenencia_etnica_autor` varchar(150) NOT NULL,
  `resguardo_autor` varchar(255) NOT NULL,
  `etnia_autor` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hechos`
--

CREATE TABLE `hechos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `hechos`
--

INSERT INTO `hechos` (`id`, `nombre`) VALUES
(1, 'Violencias de Género'),
(2, 'Desaparición Forzada'),
(3, 'Homicidio'),
(4, 'Masacre  / Homicidio colectivo'),
(5, 'Accidente por Minas Antipersonal (MAP)'),
(6, 'Municiones sin Explotar (MUSE)'),
(7, 'Artefactos Explosivos Improvisados (AEI)'),
(8, 'Secuestro'),
(9, 'Tortura'),
(10, 'Reclutamiento'),
(11, 'Uso de menores de edad para la comisión de delitos'),
(12, 'Abandono o despojo forzado de tierras'),
(13, 'Violencia intrafamiliar'),
(14, 'Delitos contra los Recursos Naturales y el Medio Ambiente'),
(15, 'Terrorismo'),
(16, 'Explotación Sexual Comercial de Niños, Niñas y Adolescentes'),
(17, 'Trata de Personas'),
(18, 'Hurtos'),
(21, 'Extorsión'),
(22, 'Delitos sexuales'),
(23, 'Secuestro'),
(24, 'Lesiones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paises`
--

CREATE TABLE `paises` (
  `id` int(11) NOT NULL,
  `iso` char(2) DEFAULT NULL,
  `nombre` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `paises`
--

INSERT INTO `paises` (`id`, `iso`, `nombre`) VALUES
(1, 'AF', 'Afganistán'),
(2, 'AX', 'Islas Gland'),
(3, 'AL', 'Albania'),
(4, 'DE', 'Alemania'),
(5, 'AD', 'Andorra'),
(6, 'AO', 'Angola'),
(7, 'AI', 'Anguilla'),
(8, 'AQ', 'Antártida'),
(9, 'AG', 'Antigua y Barbuda'),
(10, 'AN', 'Antillas Holandesas'),
(11, 'SA', 'Arabia Saudí'),
(12, 'DZ', 'Argelia'),
(13, 'AR', 'Argentina'),
(14, 'AM', 'Armenia'),
(15, 'AW', 'Aruba'),
(16, 'AU', 'Australia'),
(17, 'AT', 'Austria'),
(18, 'AZ', 'Azerbaiyán'),
(19, 'BS', 'Bahamas'),
(20, 'BH', 'Bahréin'),
(21, 'BD', 'Bangladesh'),
(22, 'BB', 'Barbados'),
(23, 'BY', 'Bielorrusia'),
(24, 'BE', 'Bélgica'),
(25, 'BZ', 'Belice'),
(26, 'BJ', 'Benin'),
(27, 'BM', 'Bermudas'),
(28, 'BT', 'Bhután'),
(29, 'BO', 'Bolivia'),
(30, 'BA', 'Bosnia y Herzegovina'),
(31, 'BW', 'Botsuana'),
(32, 'BV', 'Isla Bouvet'),
(33, 'BR', 'Brasil'),
(34, 'BN', 'Brunéi'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'CV', 'Cabo Verde'),
(39, 'KY', 'Islas Caimán'),
(40, 'KH', 'Camboya'),
(41, 'CM', 'Camerún'),
(42, 'CA', 'Canadá'),
(43, 'CF', 'República Centroafricana'),
(44, 'TD', 'Chad'),
(45, 'CZ', 'República Checa'),
(46, 'CL', 'Chile'),
(47, 'CN', 'China'),
(48, 'CY', 'Chipre'),
(49, 'CX', 'Isla de Navidad'),
(50, 'VA', 'Ciudad del Vaticano'),
(51, 'CC', 'Islas Cocos'),
(52, 'CO', 'Colombia'),
(53, 'KM', 'Comoras'),
(54, 'CD', 'República Democrática del Congo'),
(55, 'CG', 'Congo'),
(56, 'CK', 'Islas Cook'),
(57, 'KP', 'Corea del Norte'),
(58, 'KR', 'Corea del Sur'),
(59, 'CI', 'Costa de Marfil'),
(60, 'CR', 'Costa Rica'),
(61, 'HR', 'Croacia'),
(62, 'CU', 'Cuba'),
(63, 'DK', 'Dinamarca'),
(64, 'DM', 'Dominica'),
(65, 'DO', 'República Dominicana'),
(66, 'EC', 'Ecuador'),
(67, 'EG', 'Egipto'),
(68, 'SV', 'El Salvador'),
(69, 'AE', 'Emiratos Árabes Unidos'),
(70, 'ER', 'Eritrea'),
(71, 'SK', 'Eslovaquia'),
(72, 'SI', 'Eslovenia'),
(73, 'ES', 'España'),
(74, 'UM', 'Islas ultramarinas de Estados Unidos'),
(75, 'US', 'Estados Unidos'),
(76, 'EE', 'Estonia'),
(77, 'ET', 'Etiopía'),
(78, 'FO', 'Islas Feroe'),
(79, 'PH', 'Filipinas'),
(80, 'FI', 'Finlandia'),
(81, 'FJ', 'Fiyi'),
(82, 'FR', 'Francia'),
(83, 'GA', 'Gabón'),
(84, 'GM', 'Gambia'),
(85, 'GE', 'Georgia'),
(86, 'GS', 'Islas Georgias del Sur y Sandwich del Sur'),
(87, 'GH', 'Ghana'),
(88, 'GI', 'Gibraltar'),
(89, 'GD', 'Granada'),
(90, 'GR', 'Grecia'),
(91, 'GL', 'Groenlandia'),
(92, 'GP', 'Guadalupe'),
(93, 'GU', 'Guam'),
(94, 'GT', 'Guatemala'),
(95, 'GF', 'Guayana Francesa'),
(96, 'GN', 'Guinea'),
(97, 'GQ', 'Guinea Ecuatorial'),
(98, 'GW', 'Guinea-Bissau'),
(99, 'GY', 'Guyana'),
(100, 'HT', 'Haití'),
(101, 'HM', 'Islas Heard y McDonald'),
(102, 'HN', 'Honduras'),
(103, 'HK', 'Hong Kong'),
(104, 'HU', 'Hungría'),
(105, 'IN', 'India'),
(106, 'ID', 'Indonesia'),
(107, 'IR', 'Irán'),
(108, 'IQ', 'Iraq'),
(109, 'IE', 'Irlanda'),
(110, 'IS', 'Islandia'),
(111, 'IL', 'Israel'),
(112, 'IT', 'Italia'),
(113, 'JM', 'Jamaica'),
(114, 'JP', 'Japón'),
(115, 'JO', 'Jordania'),
(116, 'KZ', 'Kazajstán'),
(117, 'KE', 'Kenia'),
(118, 'KG', 'Kirguistán'),
(119, 'KI', 'Kiribati'),
(120, 'KW', 'Kuwait'),
(121, 'LA', 'Laos'),
(122, 'LS', 'Lesotho'),
(123, 'LV', 'Letonia'),
(124, 'LB', 'Líbano'),
(125, 'LR', 'Liberia'),
(126, 'LY', 'Libia'),
(127, 'LI', 'Liechtenstein'),
(128, 'LT', 'Lituania'),
(129, 'LU', 'Luxemburgo'),
(130, 'MO', 'Macao'),
(131, 'MK', 'ARY Macedonia'),
(132, 'MG', 'Madagascar'),
(133, 'MY', 'Malasia'),
(134, 'MW', 'Malawi'),
(135, 'MV', 'Maldivas'),
(136, 'ML', 'Malí'),
(137, 'MT', 'Malta'),
(138, 'FK', 'Islas Malvinas'),
(139, 'MP', 'Islas Marianas del Norte'),
(140, 'MA', 'Marruecos'),
(141, 'MH', 'Islas Marshall'),
(142, 'MQ', 'Martinica'),
(143, 'MU', 'Mauricio'),
(144, 'MR', 'Mauritania'),
(145, 'YT', 'Mayotte'),
(146, 'MX', 'México'),
(147, 'FM', 'Micronesia'),
(148, 'MD', 'Moldavia'),
(149, 'MC', 'Mónaco'),
(150, 'MN', 'Mongolia'),
(151, 'MS', 'Montserrat'),
(152, 'MZ', 'Mozambique'),
(153, 'MM', 'Myanmar'),
(154, 'NA', 'Namibia'),
(155, 'NR', 'Nauru'),
(156, 'NP', 'Nepal'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Níger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Isla Norfolk'),
(162, 'NO', 'Noruega'),
(163, 'NC', 'Nueva Caledonia'),
(164, 'NZ', 'Nueva Zelanda'),
(165, 'OM', 'Omán'),
(166, 'NL', 'Países Bajos'),
(167, 'PK', 'Pakistán'),
(168, 'PW', 'Palau'),
(169, 'PS', 'Palestina'),
(170, 'PA', 'Panamá'),
(171, 'PG', 'Papúa Nueva Guinea'),
(172, 'PY', 'Paraguay'),
(173, 'PE', 'Perú'),
(174, 'PN', 'Islas Pitcairn'),
(175, 'PF', 'Polinesia Francesa'),
(176, 'PL', 'Polonia'),
(177, 'PT', 'Portugal'),
(178, 'PR', 'Puerto Rico'),
(179, 'QA', 'Qatar'),
(180, 'GB', 'Reino Unido'),
(181, 'RE', 'Reunión'),
(182, 'RW', 'Ruanda'),
(183, 'RO', 'Rumania'),
(184, 'RU', 'Rusia'),
(185, 'EH', 'Sahara Occidental'),
(186, 'SB', 'Islas Salomón'),
(187, 'WS', 'Samoa'),
(188, 'AS', 'Samoa Americana'),
(189, 'KN', 'San Cristóbal y Nevis'),
(190, 'SM', 'San Marino'),
(191, 'PM', 'San Pedro y Miquelón'),
(192, 'VC', 'San Vicente y las Granadinas'),
(193, 'SH', 'Santa Helena'),
(194, 'LC', 'Santa Lucía'),
(195, 'ST', 'Santo Tomé y Príncipe'),
(196, 'SN', 'Senegal'),
(197, 'CS', 'Serbia y Montenegro'),
(198, 'SC', 'Seychelles'),
(199, 'SL', 'Sierra Leona'),
(200, 'SG', 'Singapur'),
(201, 'SY', 'Siria'),
(202, 'SO', 'Somalia'),
(203, 'LK', 'Sri Lanka'),
(204, 'SZ', 'Suazilandia'),
(205, 'ZA', 'Sudáfrica'),
(206, 'SD', 'Sudán'),
(207, 'SE', 'Suecia'),
(208, 'CH', 'Suiza'),
(209, 'SR', 'Surinam'),
(210, 'SJ', 'Svalbard y Jan Mayen'),
(211, 'TH', 'Tailandia'),
(212, 'TW', 'Taiwán'),
(213, 'TZ', 'Tanzania'),
(214, 'TJ', 'Tayikistán'),
(215, 'IO', 'Territorio Británico del Océano Índico'),
(216, 'TF', 'Territorios Australes Franceses'),
(217, 'TL', 'Timor Oriental'),
(218, 'TG', 'Togo'),
(219, 'TK', 'Tokelau'),
(220, 'TO', 'Tonga'),
(221, 'TT', 'Trinidad y Tobago'),
(222, 'TN', 'Túnez'),
(223, 'TC', 'Islas Turcas y Caicos'),
(224, 'TM', 'Turkmenistán'),
(225, 'TR', 'Turquía'),
(226, 'TV', 'Tuvalu'),
(227, 'UA', 'Ucrania'),
(228, 'UG', 'Uganda'),
(229, 'UY', 'Uruguay'),
(230, 'UZ', 'Uzbekistán'),
(231, 'VU', 'Vanuatu'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Islas Vírgenes Británicas'),
(235, 'VI', 'Islas Vírgenes de los Estados Unidos'),
(236, 'WF', 'Wallis y Futuna'),
(237, 'YE', 'Yemen'),
(238, 'DJ', 'Yibuti'),
(239, 'ZM', 'Zambia'),
(240, 'ZW', 'Zimbabue');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_accion`
--

CREATE TABLE `tipo_accion` (
  `id` int(11) NOT NULL,
  `id_hecho` int(11) NOT NULL,
  `tipo_accion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipo_accion`
--

INSERT INTO `tipo_accion` (`id`, `id_hecho`, `tipo_accion`) VALUES
(1, 1, 'Violencia Psicológica'),
(2, 1, 'Violencia Sexual'),
(3, 1, 'Violencia Física'),
(4, 1, 'Violencia Económica'),
(5, 5, 'Arsenal de Minas Antipersonal'),
(6, 5, 'Artefacto Explosivo Abandonado (AEA)'),
(7, 5, 'Artefacto Explosivo Improvisado (AEI)'),
(8, 6, 'Artefacto Explosivo Abandonado (AEA)'),
(9, 6, 'Artefacto Explosivo Improvisado (AEI)'),
(10, 6, 'Arsenal de Minas Antipersonal'),
(11, 7, 'Artefacto Explosivo Abandonado (AEA)'),
(12, 7, 'Artefacto Explosivo Improvisado (AEI)'),
(13, 7, 'Arsenal de Minas Antipersonal'),
(14, 8, 'Extorsivo'),
(15, 8, 'Simple'),
(16, 14, 'Caza y pezca ilegal'),
(17, 14, 'Aprovechamiento Ilícito de Recursos Naturales'),
(18, 14, 'Daño a Recursos Naturales'),
(19, 15, 'Asalto a población'),
(20, 15, 'Ataque a aeronave'),
(21, 15, 'Ataque a instalaciones de la Fuerza Pública'),
(22, 15, 'Hostigamiento'),
(23, 15, 'Emboscada'),
(24, 15, 'Contacto armado'),
(25, 15, 'Retén ilegal'),
(26, 15, 'Incursión a población'),
(27, 16, 'Utilización de NNA en prostitución'),
(28, 16, 'Utilización de NNA en la pornografía'),
(29, 16, 'Turismo Sexual que vincula a NNA'),
(30, 16, 'Matrimonios Serviles de NNA'),
(31, 18, 'Personas'),
(32, 18, 'Residencias'),
(33, 18, 'Celulares'),
(34, 18, 'Automóviles'),
(35, 18, 'Motocicletas'),
(36, 18, 'Comercio'),
(37, 18, 'Entidades Financieras'),
(38, 22, 'Acceso carnal violento'),
(39, 22, 'Acto sexual violento'),
(40, 22, 'Acceso carnal o acto sexual en persona puesta en incapacidad de resistir'),
(41, 22, 'Acceso carnal abusivo con menor de catorce años'),
(42, 22, 'Actos sexuales con menor de catorce años'),
(43, 22, 'Acceso carnal o acto sexual abusivos con incapaz de resistir'),
(44, 22, 'Acoso sexual'),
(45, 22, 'Actos sexuales con menor de catorce años (Circunstancias de agravación)'),
(46, 22, 'Inducción a la prostitución'),
(47, 22, 'Demanda de explotación sexual comercial de persona menor de 18 años de edad'),
(48, 22, 'Pornografía con personas menores de 18 años'),
(49, 22, 'Utilización o facilitación de medios de comunicación para ofrecer actividades sexuales con personas menores de 18 años'),
(50, 23, 'Extorsivo'),
(51, 23, 'Simple'),
(52, 24, 'Accidente de transito'),
(53, 24, 'Negligencia medica'),
(54, 24, 'Deslizamiento y caída'),
(55, 24, 'Difamación'),
(56, 24, 'Mordeduras de perro'),
(57, 24, 'Riñas'),
(58, 24, 'Personales');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `username` varchar(50) NOT NULL,
  `password` varchar(200) NOT NULL,
  `tipo` varchar(20) NOT NULL DEFAULT 'user',
  `cargo` varchar(150) NOT NULL,
  `codigo_dane` int(11) NOT NULL,
  `municipio_declaracion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`username`, `password`, `tipo`, `cargo`, `codigo_dane`, `municipio_declaracion`) VALUES
('cof_abr', '96cb4a28b63c4744de8a7b633de525456ea41c5f', 'user', 'Comisaría de Familia', 54003, 'Ábrego'),
('cof_arb', 'ae71a37a250e80c988943ab913156ba22d29db27', 'user', 'Comisaría de Familia', 54051, 'Arboledas'),
('cof_boc', 'bdd35c81e69e75fbdc1a9407022eb010711167e4', 'user', 'Comisaría de Familia', 54099, 'Bochalema'),
('cof_buc', '1078a906e8a975de933e3d179f2dd7de8d1f1f43', 'user', 'Comisaría de Familia', 54109, 'Bucarasica'),
('cof_cac', '954f646b9bead2d067feb85459e43dbf3c27a512', 'user', 'Comisaría de Familia', 54128, 'Cáchira'),
('cof_cal', '9eb4273508c14318dce41fc4cd8b98ad438b9cf8', 'user', 'Comisaría de Familia', 54670, 'San Calixto'),
('cof_car', '2b8e70984707e74ba2751e36e5287f77e8923974', 'user', 'Comisaría de Familia', 54245, 'El Carmen'),
('cof_chi', '3caded5e28098d2caaf9a6df7375de48b7aa02d6', 'user', 'Comisaría de Familia', 54174, 'Chitagá'),
('cof_cna', '865c924c679a79c6e11991580b1374a772ec7c92', 'user', 'Comisaría de Familia', 54172, 'Chinácota'),
('cof_con', 'ceac7393b9f196b54e48b6bc7886f35d10097d42', 'user', 'Comisaría de Familia', 54206, 'Convención'),
('cof_cta', 'd655b6fc6cdbdc9bed87ac52d928e16bb0bb3a25', 'user', 'Comisaría de Familia', 54125, 'Cácota'),
('cof_cuc', '94e008b552cd9a42df0c3c25bc8a59ac757274a1', 'user', 'Comisaría de Familia', 54001, 'Cúcuta'),
('cof_cut', '911cc8d4d202068d1907c615fe51d507ae9066b0', 'user', 'Comisaría de Familia', 54223, 'Cucutilla'),
('cof_dur', '76be93ffe838234182806a8f1d9cfba039263033', 'user', 'Comisaría de Familia', 54239, 'Durania'),
('cof_esp', '24b71204488231cd308623de2fbb2fb9cbb31677', 'user', 'Comisaría de Familia', 54385, 'La Esperanza'),
('cof_gra', 'acddf00c48e38b7d7dd61c25c73308ebc73ba624', 'user', 'Comisaría de Familia', 54313, 'Gramalote'),
('cof_hac', 'b797b75fbd259f7dbd2d1e2afd4c644483db63cf', 'user', 'Comisaría de Familia', 54344, 'Hacarí'),
('cof_her', '9d0854f16217e8540ca79762e00083c9e14f8860', 'user', 'Comisaría de Familia', 54347, 'Herrán'),
('cof_lab', 'ced2c9d943676b65c033c1dde3e5b4eae5f362a8', 'user', 'Comisaría de Familia', 54377, 'Labateca'),
('cof_lou', 'fa5f47d9890cec0ceb7a5a100032e7a7c53e100b', 'user', 'Comisaría de Familia', 54418, ' Lourdes'),
('cof_mut', 'a75cd2562aa5f89482488c6655a683c1a9e89677', 'user', 'Comisaría de Familia', 54480, 'Mutiscua'),
('cof_oca', '1a14fc99b65cda7843c30e1f9fbb63b326d492f2', 'user', 'Comisaría de Familia', 54498, ' Ocaña'),
('cof_pat', '5b1349f5b6f987b98937b9cb14f8bf2711670f50', 'user', 'Comisaría de Familia', 54405, 'Los Patios'),
('cof_pla', '5c2cbf05a06fd01b65c633e0a56eca7ec5cf8768', 'user', 'Comisaría de Familia', 54398, 'La Playa'),
('cof_pna', '00da9c72f13749234964e263d2c47df3e3c97f98', 'user', 'Comisaría de Familia', 54518, 'Pamplona'),
('cof_psa', '1800ebf898f160732355a18c46ed385f7877e282', 'user', 'Comisaría de Familia', 54553, 'Puerto Santander'),
('cof_pta', 'cae43abe7ffaaa9b2cec038398c3bff750fe59e1', 'user', 'Comisaría de Familia', 54520, 'Pamplonita'),
('cof_rag', '888383a8c728f1a14b7331dbbda08ab15f3cda27', 'user', 'Comisaría de Familia', 54599, ' Ragonvalia'),
('cof_sal', '3ead4ed46fb6979c045c1df8480be04e778e50a9', 'user', 'Comisaría de Familia', 54660, 'Salazar de Las Palmas'),
('cof_san', '0417cdf6cf4d38e7c88c9643fe08b1c992014c72', 'user', 'Comisaría de Familia', 54680, 'Santiago'),
('cof_sar', 'b02a40992b8e5665a5fe7dceb48c8fabdb3ff743', 'user', 'Comisaría de Familia', 54720, 'Sardinata'),
('cof_sca', 'fca606159456ebb8633af423fb419e929b614eaf', 'user', 'Comisaría de Familia', 54673, 'San Cayetano'),
('cof_sil', 'fe27c6ade20adbab26354fdcdae0cea2ecc466de', 'user', 'Comisaría de Familia', 54743, 'Silos'),
('cof_tar', '860d458322b7e46a8faa384d4bdd44c42bbf5e22', 'user', 'Comisaría de Familia', 54250, 'El Tarra'),
('cof_teo', '153ab36f14b34909cff20d567a475da50a5c6d94', 'user', 'Comisaría de Familia', 54800, ' Teorama'),
('cof_tib', '747f4f4a7cf838b6cc22313a24f909f283c0f067', 'user', 'Comisaría de Familia', 54810, 'Tibú'),
('cof_tol', '1b104efb1777b47a305e52d89c28e627efe606fb', 'user', 'Comisaría de Familia', 54820, 'Toledo'),
('cof_vca', 'd0cb1ac9081288667cfac4803f40021054dfe658', 'user', 'Comisaría de Familia', 54871, 'Villa Caro'),
('cof_vro', '6b6a3084d5786876e1d10969eeb499dc4eb7b3df', 'user', 'Comisaría de Familia', 54874, 'Villa del Rosario'),
('cof_zul', '68c277a78ab048fb0a09f6d7bbec3c1c1c634907', 'user', 'Comisaría de Familia', 54261, 'El Zulia'),
('gob_abr', '96cb4a28b63c4744de8a7b633de525456ea41c5f', 'user', 'Secretaria de Gobierno', 54003, 'Ábrego'),
('gob_arb', 'ae71a37a250e80c988943ab913156ba22d29db27', 'user', 'Secretaria de Gobierno', 54051, 'Arboledas'),
('gob_boc', 'bdd35c81e69e75fbdc1a9407022eb010711167e4', 'user', 'Secretaria de Gobierno', 54099, 'Bochalema'),
('gob_buc', '1078a906e8a975de933e3d179f2dd7de8d1f1f43', 'user', 'Secretaria de Gobierno', 54109, 'Bucarasica'),
('gob_cac', '954f646b9bead2d067feb85459e43dbf3c27a512', 'user', 'Secretaria de Gobierno', 54128, 'Cáchira'),
('gob_cal', '9eb4273508c14318dce41fc4cd8b98ad438b9cf8', 'user', 'Secretaria de Gobierno', 54670, 'San Calixto'),
('gob_car', '2b8e70984707e74ba2751e36e5287f77e8923974', 'user', 'Secretaria de Gobierno', 54245, 'El Carmen'),
('gob_chi', '3caded5e28098d2caaf9a6df7375de48b7aa02d6', 'user', 'Secretaria de Gobierno', 54174, 'Chitagá'),
('gob_cna', '865c924c679a79c6e11991580b1374a772ec7c92', 'user', 'Secretaria de Gobierno', 54172, 'Chinácota'),
('gob_con', 'ceac7393b9f196b54e48b6bc7886f35d10097d42', 'user', 'Secretaria de Gobierno', 54206, 'Convención'),
('gob_cta', 'd655b6fc6cdbdc9bed87ac52d928e16bb0bb3a25', 'user', 'Secretaria de Gobierno', 54125, 'Cácota'),
('gob_cuc', '94e008b552cd9a42df0c3c25bc8a59ac757274a1', 'user', 'Secretaria de Gobierno', 54001, 'Cúcuta'),
('gob_cut', '911cc8d4d202068d1907c615fe51d507ae9066b0', 'user', 'Secretaria de Gobierno', 54223, 'Cucutilla'),
('gob_dur', '76be93ffe838234182806a8f1d9cfba039263033', 'user', 'Secretaria de Gobierno', 54239, 'Durania'),
('gob_esp', '24b71204488231cd308623de2fbb2fb9cbb31677', 'user', 'Secretaria de Gobierno', 54385, 'La Esperanza'),
('gob_gra', 'acddf00c48e38b7d7dd61c25c73308ebc73ba624', 'user', 'Secretaria de Gobierno', 54313, 'Gramalote'),
('gob_hac', 'b797b75fbd259f7dbd2d1e2afd4c644483db63cf', 'user', 'Secretaria de Gobierno', 54344, 'Hacarí'),
('gob_her', '9d0854f16217e8540ca79762e00083c9e14f8860', 'user', 'Secretaria de Gobierno', 54347, 'Herrán'),
('gob_lab', 'ced2c9d943676b65c033c1dde3e5b4eae5f362a8', 'user', 'Secretaria de Gobierno', 54377, 'Labateca'),
('gob_lou', 'fa5f47d9890cec0ceb7a5a100032e7a7c53e100b', 'user', 'Secretaria de Gobierno', 54418, ' Lourdes'),
('gob_mut', 'a75cd2562aa5f89482488c6655a683c1a9e89677', 'user', 'Secretaria de Gobierno', 54480, 'Mutiscua'),
('gob_oca', '1a14fc99b65cda7843c30e1f9fbb63b326d492f2', 'user', 'Secretaria de Gobierno', 54498, ' Ocaña'),
('gob_pat', '5b1349f5b6f987b98937b9cb14f8bf2711670f50', 'user', 'Secretaria de Gobierno', 54405, 'Los Patios'),
('gob_pla', '5c2cbf05a06fd01b65c633e0a56eca7ec5cf8768', 'user', 'Secretaria de Gobierno', 54398, 'La Playa'),
('gob_pna', '00da9c72f13749234964e263d2c47df3e3c97f98', 'user', 'Secretaria de Gobierno', 54518, 'Pamplona'),
('gob_psa', '1800ebf898f160732355a18c46ed385f7877e282', 'user', 'Secretaria de Gobierno', 54553, 'Puerto Santander'),
('gob_pta', 'cae43abe7ffaaa9b2cec038398c3bff750fe59e1', 'user', 'Secretaria de Gobierno', 54520, 'Pamplonita'),
('gob_rag', '888383a8c728f1a14b7331dbbda08ab15f3cda27', 'user', 'Secretaria de Gobierno', 54599, ' Ragonvalia'),
('gob_sal', '3ead4ed46fb6979c045c1df8480be04e778e50a9', 'user', 'Secretaria de Gobierno', 54660, 'Salazar de Las Palmas'),
('gob_san', '0417cdf6cf4d38e7c88c9643fe08b1c992014c72', 'user', 'Secretaria de Gobierno', 54680, 'Santiago'),
('gob_sar', 'b02a40992b8e5665a5fe7dceb48c8fabdb3ff743', 'user', 'Secretaria de Gobierno', 54720, 'Sardinata'),
('gob_sca', 'fca606159456ebb8633af423fb419e929b614eaf', 'user', 'Secretaria de Gobierno', 54673, 'San Cayetano'),
('gob_sil', 'fe27c6ade20adbab26354fdcdae0cea2ecc466de', 'user', 'Secretaria de Gobierno', 54743, 'Silos'),
('gob_tar', '860d458322b7e46a8faa384d4bdd44c42bbf5e22', 'user', 'Secretaria de Gobierno', 54250, 'El Tarra'),
('gob_teo', '153ab36f14b34909cff20d567a475da50a5c6d94', 'user', 'Secretaria de Gobierno', 54800, ' Teorama'),
('gob_tib', '747f4f4a7cf838b6cc22313a24f909f283c0f067', 'user', 'Secretaria de Gobierno', 54810, 'Tibú'),
('gob_tol', '1b104efb1777b47a305e52d89c28e627efe606fb', 'user', 'Secretaria de Gobierno', 54820, 'Toledo'),
('gob_vca', 'd0cb1ac9081288667cfac4803f40021054dfe658', 'user', 'Secretaria de Gobierno', 54871, 'Villa Caro'),
('gob_vro', '6b6a3084d5786876e1d10969eeb499dc4eb7b3df', 'user', 'Secretaria de Gobierno', 54874, 'Villa del Rosario'),
('gob_zul', '68c277a78ab048fb0a09f6d7bbec3c1c1c634907', 'user', 'Secretaria de Gobierno', 54261, 'El Zulia'),
('inp_abr', '96cb4a28b63c4744de8a7b633de525456ea41c5f', 'user', 'Inspección de Policía', 54003, 'Ábrego'),
('inp_arb', 'ae71a37a250e80c988943ab913156ba22d29db27', 'user', 'Inspección de Policía', 54051, 'Arboledas'),
('inp_boc', 'bdd35c81e69e75fbdc1a9407022eb010711167e4', 'user', 'Inspección de Policía', 54099, 'Bochalema'),
('inp_buc', '1078a906e8a975de933e3d179f2dd7de8d1f1f43', 'user', 'Inspección de Policía', 54109, 'Bucarasica'),
('inp_cac', '954f646b9bead2d067feb85459e43dbf3c27a512', 'user', 'Inspección de Policía', 54128, 'Cáchira'),
('inp_cal', '9eb4273508c14318dce41fc4cd8b98ad438b9cf8', 'user', 'Inspección de Policía', 54670, 'San Calixto'),
('inp_car', '2b8e70984707e74ba2751e36e5287f77e8923974', 'user', 'Inspección de Policía', 54245, 'El Carmen'),
('inp_chi', '3caded5e28098d2caaf9a6df7375de48b7aa02d6', 'user', 'Inspección de Policía', 54174, 'Chitagá'),
('inp_cna', '865c924c679a79c6e11991580b1374a772ec7c92', 'user', 'Inspección de Policía', 54172, 'Chinácota'),
('inp_con', 'ceac7393b9f196b54e48b6bc7886f35d10097d42', 'user', 'Inspección de Policía', 54206, 'Convención'),
('inp_cta', 'd655b6fc6cdbdc9bed87ac52d928e16bb0bb3a25', 'user', 'Inspección de Policía', 54125, 'Cácota'),
('inp_cuc', '94e008b552cd9a42df0c3c25bc8a59ac757274a1', 'user', 'Inspección de Policía', 54001, 'Cúcuta'),
('inp_cut', '911cc8d4d202068d1907c615fe51d507ae9066b0', 'user', 'Inspección de Policía', 54223, 'Cucutilla'),
('inp_dur', '76be93ffe838234182806a8f1d9cfba039263033', 'user', 'Inspección de Policía', 54239, 'Durania'),
('inp_esp', '24b71204488231cd308623de2fbb2fb9cbb31677', 'user', 'Inspección de Policía', 54385, 'La Esperanza'),
('inp_gra', 'acddf00c48e38b7d7dd61c25c73308ebc73ba624', 'user', 'Inspección de Policía', 54313, 'Gramalote'),
('inp_hac', 'b797b75fbd259f7dbd2d1e2afd4c644483db63cf', 'user', 'Inspección de Policía', 54344, 'Hacarí'),
('inp_her', '9d0854f16217e8540ca79762e00083c9e14f8860', 'user', 'Inspección de Policía', 54347, 'Herrán'),
('inp_lab', 'ced2c9d943676b65c033c1dde3e5b4eae5f362a8', 'user', 'Inspección de Policía', 54377, 'Labateca'),
('inp_lou', 'fa5f47d9890cec0ceb7a5a100032e7a7c53e100b', 'user', 'Inspección de Policía', 54418, ' Lourdes'),
('inp_mut', 'a75cd2562aa5f89482488c6655a683c1a9e89677', 'user', 'Inspección de Policía', 54480, 'Mutiscua'),
('inp_oca', '1a14fc99b65cda7843c30e1f9fbb63b326d492f2', 'user', 'Inspección de Policía', 54498, ' Ocaña'),
('inp_pat', '5b1349f5b6f987b98937b9cb14f8bf2711670f50', 'user', 'Inspección de Policía', 54405, 'Los Patios'),
('inp_pla', '5c2cbf05a06fd01b65c633e0a56eca7ec5cf8768', 'user', 'Inspección de Policía', 54398, 'La Playa'),
('inp_pna', '00da9c72f13749234964e263d2c47df3e3c97f98', 'user', 'Inspección de Policía', 54518, 'Pamplona'),
('inp_psa', '1800ebf898f160732355a18c46ed385f7877e282', 'user', 'Inspección de Policía', 54553, 'Puerto Santander'),
('inp_pta', 'cae43abe7ffaaa9b2cec038398c3bff750fe59e1', 'user', 'Inspección de Policía', 54520, 'Pamplonita'),
('inp_rag', '888383a8c728f1a14b7331dbbda08ab15f3cda27', 'user', 'Inspección de Policía', 54599, ' Ragonvalia'),
('inp_sal', '3ead4ed46fb6979c045c1df8480be04e778e50a9', 'user', 'Inspección de Policía', 54660, 'Salazar de Las Palmas'),
('inp_san', '0417cdf6cf4d38e7c88c9643fe08b1c992014c72', 'user', 'Inspección de Policía', 54680, 'Santiago'),
('inp_sar', 'b02a40992b8e5665a5fe7dceb48c8fabdb3ff743', 'user', 'Inspección de Policía', 54720, 'Sardinata'),
('inp_sca', 'fca606159456ebb8633af423fb419e929b614eaf', 'user', 'Inspección de Policía', 54673, 'San Cayetano'),
('inp_sil', 'fe27c6ade20adbab26354fdcdae0cea2ecc466de', 'user', 'Inspección de Policía', 54743, 'Silos'),
('inp_tar', '860d458322b7e46a8faa384d4bdd44c42bbf5e22', 'user', 'Inspección de Policía', 54250, 'El Tarra'),
('inp_teo', '153ab36f14b34909cff20d567a475da50a5c6d94', 'user', 'Inspección de Policía', 54800, ' Teorama'),
('inp_tib', '747f4f4a7cf838b6cc22313a24f909f283c0f067', 'user', 'Inspección de Policía', 54810, 'Tibú'),
('inp_tol', '1b104efb1777b47a305e52d89c28e627efe606fb', 'user', 'Inspección de Policía', 54820, 'Toledo'),
('inp_vca', 'd0cb1ac9081288667cfac4803f40021054dfe658', 'user', 'Inspección de Policía', 54871, 'Villa Caro'),
('inp_vro', '6b6a3084d5786876e1d10969eeb499dc4eb7b3df', 'user', 'Inspección de Policía', 54874, 'Villa del Rosario'),
('inp_zul', '68c277a78ab048fb0a09f6d7bbec3c1c1c634907', 'user', 'Inspección de Policía', 54261, 'El Zulia'),
('per_abr', '96cb4a28b63c4744de8a7b633de525456ea41c5f', 'user', 'Personería', 54003, 'Ábrego'),
('per_arb', 'ae71a37a250e80c988943ab913156ba22d29db27', 'user', 'Personería', 54051, 'Arboledas'),
('per_boc', 'bdd35c81e69e75fbdc1a9407022eb010711167e4', 'user', 'Personería', 54099, 'Bochalema'),
('per_buc', '1078a906e8a975de933e3d179f2dd7de8d1f1f43', 'user', 'Personería', 54109, 'Bucarasica'),
('per_cac', '954f646b9bead2d067feb85459e43dbf3c27a512', 'user', 'Personería', 54128, 'Cáchira'),
('per_cal', '9eb4273508c14318dce41fc4cd8b98ad438b9cf8', 'user', 'Personería', 54670, 'San Calixto'),
('per_car', '2b8e70984707e74ba2751e36e5287f77e8923974', 'user', 'Personería', 54245, 'El Carmen'),
('per_chi', '3caded5e28098d2caaf9a6df7375de48b7aa02d6', 'user', 'Personería', 54174, 'Chitagá'),
('per_cna', '865c924c679a79c6e11991580b1374a772ec7c92', 'user', 'Personería', 54172, 'Chinácota'),
('per_con', 'ceac7393b9f196b54e48b6bc7886f35d10097d42', 'user', 'Personería', 54206, 'Convención'),
('per_cta', 'd655b6fc6cdbdc9bed87ac52d928e16bb0bb3a25', 'user', 'Personería', 54125, 'Cácota'),
('per_cuc', '94e008b552cd9a42df0c3c25bc8a59ac757274a1', 'user', 'Personería', 54001, 'Cúcuta'),
('per_cut', '911cc8d4d202068d1907c615fe51d507ae9066b0', 'user', 'Personería', 54223, 'Cucutilla'),
('per_dur', '76be93ffe838234182806a8f1d9cfba039263033', 'user', 'Personería', 54239, 'Durania'),
('per_esp', '24b71204488231cd308623de2fbb2fb9cbb31677', 'user', 'Personería', 54385, 'La Esperanza'),
('per_gra', 'acddf00c48e38b7d7dd61c25c73308ebc73ba624', 'user', 'Personería', 54313, 'Gramalote'),
('per_hac', 'b797b75fbd259f7dbd2d1e2afd4c644483db63cf', 'user', 'Personería', 54344, 'Hacarí'),
('per_her', '9d0854f16217e8540ca79762e00083c9e14f8860', 'user', 'Personería', 54347, 'Herrán'),
('per_lab', 'ced2c9d943676b65c033c1dde3e5b4eae5f362a8', 'user', 'Personería', 54377, 'Labateca'),
('per_lou', 'fa5f47d9890cec0ceb7a5a100032e7a7c53e100b', 'user', 'Personería', 54418, ' Lourdes'),
('per_mut', 'a75cd2562aa5f89482488c6655a683c1a9e89677', 'user', 'Personería', 54480, 'Mutiscua'),
('per_oca', '1a14fc99b65cda7843c30e1f9fbb63b326d492f2', 'user', 'Personería', 54498, ' Ocaña'),
('per_pat', '5b1349f5b6f987b98937b9cb14f8bf2711670f50', 'user', 'Personería', 54405, 'Los Patios'),
('per_pla', '5c2cbf05a06fd01b65c633e0a56eca7ec5cf8768', 'user', 'Personería', 54398, 'La Playa'),
('per_pna', '00da9c72f13749234964e263d2c47df3e3c97f98', 'user', 'Personería', 54518, 'Pamplona'),
('per_psa', '1800ebf898f160732355a18c46ed385f7877e282', 'user', 'Personería', 54553, 'Puerto Santander'),
('per_pta', 'cae43abe7ffaaa9b2cec038398c3bff750fe59e1', 'user', 'Personería', 54520, 'Pamplonita'),
('per_rag', '888383a8c728f1a14b7331dbbda08ab15f3cda27', 'user', 'Personería', 54599, ' Ragonvalia'),
('per_sal', '3ead4ed46fb6979c045c1df8480be04e778e50a9', 'user', 'Personería', 54660, 'Salazar de Las Palmas'),
('per_san', '0417cdf6cf4d38e7c88c9643fe08b1c992014c72', 'user', 'Personería', 54680, 'Santiago'),
('per_sar', 'b02a40992b8e5665a5fe7dceb48c8fabdb3ff743', 'user', 'Personería', 54720, 'Sardinata'),
('per_sca', 'fca606159456ebb8633af423fb419e929b614eaf', 'user', 'Personería', 54673, 'San Cayetano'),
('per_sil', 'fe27c6ade20adbab26354fdcdae0cea2ecc466de', 'user', 'Personería', 54743, 'Silos'),
('per_tar', '860d458322b7e46a8faa384d4bdd44c42bbf5e22', 'user', 'Personería', 54250, 'El Tarra'),
('per_teo', '153ab36f14b34909cff20d567a475da50a5c6d94', 'user', 'Personería', 54800, ' Teorama'),
('per_tib', '747f4f4a7cf838b6cc22313a24f909f283c0f067', 'user', 'Personería', 54810, 'Tibú'),
('per_tol', '1b104efb1777b47a305e52d89c28e627efe606fb', 'user', 'Personería', 54820, 'Toledo'),
('per_vca', 'd0cb1ac9081288667cfac4803f40021054dfe658', 'user', 'Personería', 54871, 'Villa Caro'),
('per_vro', '6b6a3084d5786876e1d10969eeb499dc4eb7b3df', 'user', 'Personería', 54874, 'Villa del Rosario'),
('per_zul', '68c277a78ab048fb0a09f6d7bbec3c1c1c634907', 'user', 'Personería', 54261, 'El Zulia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `formulario_recepcion_informacion`
--
ALTER TABLE `formulario_recepcion_informacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- Indices de la tabla `hechos`
--
ALTER TABLE `hechos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `paises`
--
ALTER TABLE `paises`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipo_accion`
--
ALTER TABLE `tipo_accion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hecho` (`id_hecho`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `formulario_recepcion_informacion`
--
ALTER TABLE `formulario_recepcion_informacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `hechos`
--
ALTER TABLE `hechos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `paises`
--
ALTER TABLE `paises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=241;

--
-- AUTO_INCREMENT de la tabla `tipo_accion`
--
ALTER TABLE `tipo_accion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `formulario_recepcion_informacion`
--
ALTER TABLE `formulario_recepcion_informacion`
  ADD CONSTRAINT `formulario_recepcion_informacion_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`username`);

--
-- Filtros para la tabla `tipo_accion`
--
ALTER TABLE `tipo_accion`
  ADD CONSTRAINT `tipo_accion_ibfk_1` FOREIGN KEY (`id_hecho`) REFERENCES `hechos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
