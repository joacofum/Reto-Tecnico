-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2022 a las 04:14:06
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nombre`) VALUES
('Deporte'),
('Entretenimiento'),
('Geografía'),
('Historia'),
('Musica');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `nickname` varchar(255) NOT NULL,
  `contrasenia` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `jugador`
--

INSERT INTO `jugador` (`nickname`, `contrasenia`) VALUES
('elabuelomax', '1234'),
('frank', '1234'),
('janevo', '1234'),
('joacofum', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida`
--

CREATE TABLE `partida` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `puntajeFinal` int(11) NOT NULL,
  `jugador_nickname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `partida`
--

INSERT INTO `partida` (`id`, `fecha`, `puntajeFinal`, `jugador_nickname`) VALUES
(1, '2022-06-01', 30, 'joacofum'),
(2, '2022-06-01', 30, 'janevo'),
(3, '2022-06-01', 30, 'frank'),
(4, '2022-06-01', 10, 'frank'),
(5, '2022-06-01', 250, 'joacofum'),
(6, '2022-06-01', 80, 'elabuelomax'),
(7, '2022-06-01', 0, 'elabuelomax');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partida_ronda`
--

CREATE TABLE `partida_ronda` (
  `Partida_id` int(11) NOT NULL,
  `rondas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `partida_ronda`
--

INSERT INTO `partida_ronda` (`Partida_id`, `rondas_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(4, 10),
(5, 11),
(5, 12),
(5, 13),
(5, 14),
(5, 15),
(6, 16),
(6, 17),
(6, 18),
(6, 19),
(7, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `nivel` int(11) NOT NULL,
  `puntos` int(11) NOT NULL,
  `categoria_nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pregunta`
--

INSERT INTO `pregunta` (`id`, `descripcion`, `nivel`, `puntos`, `categoria_nombre`) VALUES
(2, '¿xd?', 1, 10, 'Entretenimiento'),
(3, '¿De qué nacionalidad era Juana de Arco?', 1, 10, 'Historia'),
(4, '¿Quién dibujo al famoso Hombre de Vitruvio?', 2, 20, 'Historia'),
(5, '¿Qué famoso filósofo fue maestro de Alejandro Magno durante cinco años?', 3, 50, 'Historia'),
(6, '¿Quién fue el último zar de Rusia?', 4, 70, 'Historia'),
(7, '¿A qué emperador romano asesinó un grupo de senadores?', 5, 100, 'Historia'),
(8, '¿Qué jugador de fútbol ha ganado más copas del mundo?', 1, 10, 'Deporte'),
(9, '¿Qué selección ganó la primera Copa del Mundo (1930)?', 2, 20, 'Deporte'),
(10, 'El máximo goleador de la historia de la Copa del Mundo hizo 16 tantos, ¿quién es?', 3, 50, 'Deporte'),
(11, '¿A qué país pertenece la Liga Calcio?', 4, 70, 'Deporte'),
(12, '¿En qué año ganó el balón de oro Roberto Baggio?', 5, 100, 'Deporte'),
(13, '¿Cómo se llamaba el cantante de Queen?', 2, 20, 'Entretenimiento'),
(14, '¿Cuál es la película más taquillera de la historia?', 3, 50, 'Entretenimiento'),
(15, '¿Cuál es la película animada más taquillera de la historia?', 4, 70, 'Entretenimiento'),
(16, 'Gatsu es el protagonista del manga escrito por Kentaro Miura. ¿Cómo se llama el manga?', 5, 100, 'Entretenimiento'),
(17, '¿Cuántos océanos hay en la Tierra?', 1, 10, 'Geografía'),
(18, '¿Cuál es el río más largo del mundo?', 2, 20, 'Geografía'),
(19, '¿Cuál es el segundo país más poblado del mundo?', 3, 50, 'Geografía'),
(20, '¿Cuál es el segundo idioma más hablado del mundo?', 4, 70, 'Geografía'),
(21, '¿Cuántos mares existen en la Tierra?', 4, 100, 'Geografía'),
(22, '¿Qué estrella de los 80 es reconocida por Guinness World Records como la artista femenina más vendida de todos los tiempos?', 2, 20, 'Musica'),
(23, '¿Quién es conocido como el rey del Pop?', 1, 10, 'Musica'),
(24, '¿Cuál es el nombre artístico de Robyn Fenty?', 3, 50, 'Musica'),
(25, '¿Cuál es el segundo disco más vendido de la historia?', 4, 70, 'Musica'),
(26, '¿Cuál fue la última canción que Bob Marley tocó en directo?', 5, 100, 'Musica'),
(27, '¿Qué película hizo famoso al director James Cameron?', 1, 10, 'Entretenimiento');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta_respuesta`
--

CREATE TABLE `pregunta_respuesta` (
  `Pregunta_id` int(11) NOT NULL,
  `respuestas_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pregunta_respuesta`
--

INSERT INTO `pregunta_respuesta` (`Pregunta_id`, `respuestas_id`) VALUES
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 5),
(3, 6),
(3, 7),
(3, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 13),
(5, 14),
(5, 15),
(5, 16),
(6, 17),
(6, 18),
(6, 19),
(6, 20),
(7, 21),
(7, 22),
(7, 23),
(7, 24),
(8, 25),
(8, 26),
(8, 27),
(8, 28),
(9, 29),
(9, 30),
(9, 31),
(9, 32),
(10, 33),
(10, 34),
(10, 35),
(10, 36),
(11, 37),
(11, 38),
(11, 39),
(11, 40),
(12, 41),
(12, 42),
(12, 43),
(12, 44),
(13, 45),
(13, 46),
(13, 47),
(13, 48),
(14, 49),
(14, 50),
(14, 51),
(14, 52),
(15, 53),
(15, 54),
(15, 55),
(15, 56),
(16, 57),
(16, 58),
(16, 59),
(16, 60),
(17, 61),
(17, 62),
(17, 63),
(17, 64),
(18, 65),
(18, 66),
(18, 67),
(18, 68),
(19, 69),
(19, 70),
(19, 71),
(19, 72),
(20, 73),
(20, 74),
(20, 75),
(20, 76),
(21, 77),
(21, 78),
(21, 79),
(21, 80),
(22, 81),
(22, 82),
(22, 83),
(22, 84),
(23, 85),
(23, 86),
(23, 87),
(23, 88),
(24, 89),
(24, 90),
(24, 91),
(24, 92),
(25, 93),
(25, 94),
(25, 95),
(25, 96),
(26, 97),
(26, 98),
(26, 99),
(26, 100),
(27, 101),
(27, 102),
(27, 103),
(27, 104);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `isCorrecta` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `respuesta`
--

INSERT INTO `respuesta` (`id`, `descripcion`, `isCorrecta`) VALUES
(1, 'Si', b'1'),
(2, 'Más o menos', b'0'),
(3, 'No', b'0'),
(4, 'Capaz', b'0'),
(5, 'Francesa', b'1'),
(6, 'Inglesa', b'0'),
(7, 'Italiana', b'0'),
(8, 'Uruguaya', b'0'),
(9, 'Leonardo da Vinci', b'1'),
(10, 'Miguel Angel', b'0'),
(11, 'Rubens', b'0'),
(12, 'Lionel Messi', b'0'),
(13, 'Aristóteles', b'1'),
(14, 'Sócrates', b'0'),
(15, 'Platón', b'0'),
(16, 'Tesla', b'0'),
(17, 'Nicolas II', b'1'),
(18, 'Pedro I el Grande', b'0'),
(19, 'Alejandro II', b'0'),
(20, 'Vladimir Putin', b'0'),
(21, 'Julio César', b'1'),
(22, 'Nerón', b'0'),
(23, 'Calígula', b'0'),
(24, 'Bonomi', b'0'),
(25, 'Pelé', b'1'),
(26, 'Diego Maradona', b'0'),
(27, 'Giuseppe Meazza', b'0'),
(28, 'Obdulio Varela', b'0'),
(29, 'Uruguay', b'1'),
(30, 'Brasil', b'0'),
(31, 'Argentina', b'0'),
(32, 'Colombia', b'0'),
(33, 'Miroslav Klose', b'1'),
(34, 'Pelé', b'0'),
(35, 'Lionel Messi', b'0'),
(36, 'Luis Suarez', b'0'),
(37, 'Italia', b'1'),
(38, 'Alemania', b'0'),
(39, 'Cuba', b'0'),
(40, 'Brasil', b'0'),
(41, '1993', b'1'),
(42, '1991', b'0'),
(43, '2002', b'0'),
(44, '1998', b'0'),
(45, 'Freddy Mercury', b'1'),
(46, 'Alfredo Mercurio', b'0'),
(47, 'Marie Curie', b'0'),
(48, 'Jackie Chan', b'0'),
(49, 'Avatar (2009)', b'1'),
(50, 'Vengadores: Endgame (2019)', b'0'),
(51, 'Titanic (1997)', b'0'),
(52, 'Vengadores: Infinity War (2018)', b'0'),
(53, 'Frozen. El Reino del Hielo (2013)', b'1'),
(54, 'Los Increíbles 2 (2018)', b'0'),
(55, 'Los Minions (2015)', b'0'),
(56, 'Buscando a Dory (2016)', b'0'),
(57, 'Berserker', b'1'),
(58, 'One Piece', b'0'),
(59, 'Naruto', b'0'),
(60, 'Digimon', b'0'),
(61, '5', b'1'),
(62, '4', b'0'),
(63, '6', b'0'),
(64, '3', b'0'),
(65, 'Nilo', b'1'),
(66, 'Amazonas', b'0'),
(67, 'Uruguay', b'0'),
(68, 'Putumayo', b'0'),
(69, 'India', b'1'),
(70, 'China', b'0'),
(71, 'Estados Unidos', b'0'),
(72, 'Pakistan', b'0'),
(73, 'Chino mandarín', b'1'),
(74, 'Inglés', b'0'),
(75, 'Español', b'0'),
(76, 'Hindi', b'0'),
(77, '60', b'1'),
(78, '59', b'0'),
(79, '61', b'0'),
(80, '62', b'0'),
(81, 'Madonna', b'1'),
(82, 'Celine Dion', b'0'),
(83, 'Gloria Estefani', b'0'),
(84, 'Whitney Houston', b'0'),
(85, 'Michael Jackson', b'1'),
(86, 'Justin Bieber', b'0'),
(87, 'Jaime Roos', b'0'),
(88, 'Ricky Martin', b'0'),
(89, 'Rihanna', b'1'),
(90, 'Adele', b'0'),
(91, 'Dido', b'0'),
(92, 'Fergie', b'0'),
(93, 'The Dark Side of the Moon - Pink Floyd', b'1'),
(94, 'Thriller- Michael Jackson', b'0'),
(95, 'Back in Black- AC/DC', b'0'),
(96, 'Their Greatest Hits- Eagles', b'0'),
(97, 'Redemption Song', b'1'),
(98, 'Satisfy My Soul', b'0'),
(99, 'Zimbabwe', b'0'),
(100, 'Rainbow Country', b'0'),
(101, 'Titanic', b'1'),
(102, 'Avatar', b'0'),
(103, 'Terminator', b'0'),
(104, 'Aliens: el regreso', b'0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ronda`
--

CREATE TABLE `ronda` (
  `id` int(11) NOT NULL,
  `isCompletada` bit(1) NOT NULL,
  `categoria_nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ronda`
--

INSERT INTO `ronda` (`id`, `isCompletada`, `categoria_nombre`) VALUES
(1, b'0', 'Geografía'),
(2, b'0', 'Deporte'),
(3, b'0', 'Historia'),
(4, b'0', 'Historia'),
(5, b'0', 'Entretenimiento'),
(6, b'0', 'Historia'),
(7, b'0', 'Musica'),
(8, b'0', 'Historia'),
(9, b'0', 'Historia'),
(10, b'0', 'Entretenimiento'),
(11, b'0', 'Musica'),
(12, b'0', 'Musica'),
(13, b'0', 'Entretenimiento'),
(14, b'0', 'Historia'),
(15, b'0', 'Historia'),
(16, b'0', 'Historia'),
(17, b'0', 'Deporte'),
(18, b'0', 'Historia'),
(19, b'0', 'Musica'),
(20, b'0', 'Historia');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`nickname`);

--
-- Indices de la tabla `partida`
--
ALTER TABLE `partida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_lnlkcgsu596q17vdvfqcgrueo` (`jugador_nickname`);

--
-- Indices de la tabla `partida_ronda`
--
ALTER TABLE `partida_ronda`
  ADD UNIQUE KEY `UK_fhd7ypsjmmh6oio7ndn76mgsb` (`rondas_id`),
  ADD KEY `FK_gwy1fs02vky30tcjr7vbi1yf` (`Partida_id`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_m70sn8623ronb5t44ucp22ej` (`categoria_nombre`);

--
-- Indices de la tabla `pregunta_respuesta`
--
ALTER TABLE `pregunta_respuesta`
  ADD UNIQUE KEY `UK_dsf1o3erie4wtsunf95c9ydlr` (`respuestas_id`),
  ADD KEY `FK_lcfsne15wyl14ef3jjpew3aad` (`Pregunta_id`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_1g6tiv135dha78biidsacy0r1` (`categoria_nombre`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `partida`
--
ALTER TABLE `partida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT de la tabla `ronda`
--
ALTER TABLE `ronda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `partida`
--
ALTER TABLE `partida`
  ADD CONSTRAINT `FK_lnlkcgsu596q17vdvfqcgrueo` FOREIGN KEY (`jugador_nickname`) REFERENCES `jugador` (`nickname`);

--
-- Filtros para la tabla `partida_ronda`
--
ALTER TABLE `partida_ronda`
  ADD CONSTRAINT `FK_fhd7ypsjmmh6oio7ndn76mgsb` FOREIGN KEY (`rondas_id`) REFERENCES `ronda` (`id`),
  ADD CONSTRAINT `FK_gwy1fs02vky30tcjr7vbi1yf` FOREIGN KEY (`Partida_id`) REFERENCES `partida` (`id`);

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `FK_m70sn8623ronb5t44ucp22ej` FOREIGN KEY (`categoria_nombre`) REFERENCES `categoria` (`nombre`);

--
-- Filtros para la tabla `pregunta_respuesta`
--
ALTER TABLE `pregunta_respuesta`
  ADD CONSTRAINT `FK_dsf1o3erie4wtsunf95c9ydlr` FOREIGN KEY (`respuestas_id`) REFERENCES `respuesta` (`id`),
  ADD CONSTRAINT `FK_lcfsne15wyl14ef3jjpew3aad` FOREIGN KEY (`Pregunta_id`) REFERENCES `pregunta` (`id`);

--
-- Filtros para la tabla `ronda`
--
ALTER TABLE `ronda`
  ADD CONSTRAINT `FK_1g6tiv135dha78biidsacy0r1` FOREIGN KEY (`categoria_nombre`) REFERENCES `categoria` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
