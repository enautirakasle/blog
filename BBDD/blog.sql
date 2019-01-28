-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-01-2019 a las 13:24:08
-- Versión del servidor: 10.1.35-MariaDB
-- Versión de PHP: 7.1.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `blog`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `descripcion` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`) VALUES
(3, 'economía', NULL),
(4, 'deporte', NULL),
(5, 'politica', NULL),
(6, 'mundo', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `paginas`
--

CREATE TABLE `paginas` (
  `id` int(11) NOT NULL,
  `nombre` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `contenido` text COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `titulo` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `imagen` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cuerpo` text COLLATE utf8_unicode_ci NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_categoria` int(11) DEFAULT NULL,
  `publico` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `titulo`, `imagen`, `cuerpo`, `id_usuario`, `id_categoria`, `publico`) VALUES
(1, 'Beharrezko bultzadarako aukera dute demokratek', NULL, 'Inkesten arabera, demokratek Ordezkarien Ganberaren kontrola berreskuratuko dute. Migrazioaren kontrako mezuan zentratu du kanpaina Donald Trumpek', 2, 5, 0),
(2, 'eguraldi txarraa', NULL, 'adsf dsf asd s ddf as', 1, 6, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `publicos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `publicos` (
`id` int(11)
,`titulo` varchar(128)
,`cuerpo` text
,`categoria` varchar(32)
,`nombre_creador` varchar(32)
,`apellido_creador` varchar(32)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags`
--

CREATE TABLE `tags` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tags`
--

INSERT INTO `tags` (`id`, `nombre`) VALUES
(4, 'comida'),
(2, 'corrupción'),
(1, 'guerra'),
(5, 'mtv');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tags_posts`
--

CREATE TABLE `tags_posts` (
  `id_post` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `tags_posts`
--

INSERT INTO `tags_posts` (`id_post`, `id_tag`) VALUES
(1, 2),
(1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `apellido` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dni` varchar(9) COLLATE utf8_unicode_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellido`, `dni`, `activo`) VALUES
(1, 'Adrian', NULL, '1111111a', 0),
(2, 'Jon', 'Santamaria', '22222222b', 1),
(3, 'Aitor', 'Urazurrutia', '12341234f', 0);

-- --------------------------------------------------------

--
-- Estructura para la vista `publicos`
--
DROP TABLE IF EXISTS `publicos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `publicos`  AS  (select `p`.`id` AS `id`,`p`.`titulo` AS `titulo`,`p`.`cuerpo` AS `cuerpo`,`c`.`nombre` AS `categoria`,`u`.`nombre` AS `nombre_creador`,`u`.`apellido` AS `apellido_creador` from ((`posts` `p` left join `categorias` `c` on((`p`.`id_categoria` = `c`.`id_categoria`))) join `usuarios` `u` on((`p`.`id_usuario` = `u`.`id`))) where (`p`.`publico` = 1)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `paginas`
--
ALTER TABLE `paginas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `titulo` (`titulo`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `tags_posts`
--
ALTER TABLE `tags_posts`
  ADD PRIMARY KEY (`id_post`,`id_tag`),
  ADD KEY `tag_id` (`id_tag`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `dni` (`dni`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `paginas`
--
ALTER TABLE `paginas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `paginas`
--
ALTER TABLE `paginas`
  ADD CONSTRAINT `paginas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `posts_ibfk_2` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id_categoria`) ON DELETE SET NULL,
  ADD CONSTRAINT `posts_ibfk_3` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `tags_posts`
--
ALTER TABLE `tags_posts`
  ADD CONSTRAINT `tags_posts_ibfk_1` FOREIGN KEY (`id_post`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `tags_posts_ibfk_2` FOREIGN KEY (`id_tag`) REFERENCES `tags` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
