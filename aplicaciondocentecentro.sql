-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-10-2023 a las 01:30:06
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aplicaciondocentecentro`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_login`
--

CREATE TABLE `admin_login` (
  `ID_admin` int(11) NOT NULL,
  `Correo electronico` varchar(60) NOT NULL,
  `Contraseña` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asesores`
--

CREATE TABLE `asesores` (
  `ID_asesor` int(11) NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Correo_asesor` varchar(60) DEFAULT NULL,
  `Carrera` varchar(100) DEFAULT NULL,
  `Rol` varchar(100) DEFAULT NULL,
  `Especialidad` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asesores`
--

INSERT INTO `asesores` (`ID_asesor`, `Nombre`, `Correo_asesor`, `Carrera`, `Rol`, `Especialidad`) VALUES
(1, 'Rodrigo Moya Sobarzo', '', 'Ingeniero Comercial ', 'Asesor Pedagogico/Unidad de Estudio', 'Seguimiento y estudio y PID'),
(2, 'Mariel Soto Riveros', '', 'Licenciada en Educación', 'Asesor Pedagogico', 'Virtualización, asesoria docente y Impulsa tu RED'),
(3, 'Georgina Durán Jiménez', '', 'PosDoctorada en Difusión de Conocimiento', 'Asesor Pedagogico', 'Virtualización, comunidad de aprendizaje, asesoria docente'),
(4, 'Jaime Orellana García', '', 'Arquitecto', 'Asesor Pedagogico', 'Laboratorio Experimental - Realidades Extendidas'),
(5, 'Sergio Sanhueza', '', 'Magister en Psicologia', 'Asesor Pedagogico', 'Bienestar Docente, asesoria docente  y comunidades de aprendizaje'),
(6, 'Fabiola Castro Sepulveda', '', 'Secretaria', 'Secretaria', 'Gestión agenda Dirección , espacios y procesos'),
(7, 'Felipe Bello Poblete', '', 'Diseñador Grafico', 'Diseño Multimedia', 'Diseño recursos multimedia'),
(8, 'Sebastián Garrido Reyes', '', 'Ingeniero Comercial', 'Seguimiento / Unidad de Estudio', 'Seguimiento y estudio, Datos'),
(9, 'Juan Maripillan', '', 'Inge. Civil Telemático', 'Administrados de plataformas', 'EDUCA Blackboard,moodle,  zoom , nearpod'),
(10, 'Wilma Vidal', '', 'Magister en Psicologia', 'Asesor Pedagogico', 'Comunidades de aprendizaje, asesoria docente , guias de aprendizaje'),
(11, 'Eileen Makarena Pardo', '', 'Licenciada en Educación', 'Asesor Pedagogico', 'Asesoria docente, innovación , realidades extendidas'),
(12, 'Teresa Castro', '', 'Magister', 'Asesor Pedagogico', 'Asesoria docente, Virtualización y  guias de aprendizaje'),
(13, 'Ricardo Garcia', '', 'Doctor', 'Asesor Pedagogico', 'Investigación, comunidades de aprendizaje y asesoria Docente'),
(14, 'Gema Pascual', '', 'Doctora', 'Asesor Pedagogico', 'Formación docente, comunidades de aprendizaje, circulos docentes  y asesoria Docente'),
(15, 'Monica Kaechele Obreque', '', 'Doctora en Educaión y Sociedad', 'Academica- Directora', 'Directora CINAP'),
(16, 'Claudio Palma Ávila', '', 'Magister en Educación', 'Asesor Pedagogico', 'Educación Digital, asesoria docente, virtualización, Tutores Elearning'),
(17, 'Maria Constanza Uribe', '', 'Licenciada en Diseño Grafico', 'Diseño Multimedia', 'Diseño recursos multimedia'),
(18, 'Christian Bajas Torres', '', 'Diseñador Digital', 'Diseño Multimedia', 'Diseño recursos multimedia'),
(19, 'Jorge Yañez Sepulveda', '', 'Magister', 'Asesor Pedagogico', 'Virtualización, asesoria docente  y  seguimiento y estudio'),
(20, 'Rocio Cristi', '', 'Magister', 'Asesor Pedagogico', 'Colaegio de ayudantes , comunidades de aprendizaje y asesoria Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registros`
--

CREATE TABLE `registros` (
  `ID_Registro` int(11) NOT NULL,
  `ID_usuario` int(11) NOT NULL,
  `ID_asesor` int(11) NOT NULL,
  `ID_admin` int(11) NOT NULL,
  `ID_servicio` int(11) DEFAULT NULL,
  `Correo electronico` varchar(60) DEFAULT NULL,
  `Hora_visita` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `servicios`
--

CREATE TABLE `servicios` (
  `ID_servicio` int(11) NOT NULL,
  `ID_asesor` int(11) DEFAULT NULL,
  `Nombre_servicio` varchar(50) DEFAULT NULL,
  `Correo_asesor` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users_table`
--

CREATE TABLE `users_table` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users_table`
--

INSERT INTO `users_table` (`user_id`, `user_name`, `user_email`, `user_password`) VALUES
(1, 'martin', 'martin123@gmail.com', '34f74c049edea51851c6924f4a386762'),
(2, 'pedro', 'pedro123@gmail.com', 'd3ce9efea6244baa7bf718f12dd0c331'),
(5, 'sebastian', 'seba123@gmail.com', 'd494f3650319d882495067a92b217ff9'),
(6, 'daniel', 'daniel123@gmail.com', 'b5ea8985533defbf1d08d5ed2ac8fe9b');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_login`
--

CREATE TABLE `usuarios_login` (
  `ID_usuario` int(11) NOT NULL,
  `user_email` varchar(20) DEFAULT NULL,
  `user_password` varchar(15) DEFAULT NULL,
  `user_name` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios_login`
--

INSERT INTO `usuarios_login` (`ID_usuario`, `user_email`, `user_password`, `user_name`) VALUES
(0, 'martin123@gmail.com', '34f74c049edea51', 'martin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_login`
--
ALTER TABLE `admin_login`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Indices de la tabla `asesores`
--
ALTER TABLE `asesores`
  ADD PRIMARY KEY (`ID_asesor`);

--
-- Indices de la tabla `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`ID_Registro`);

--
-- Indices de la tabla `servicios`
--
ALTER TABLE `servicios`
  ADD PRIMARY KEY (`ID_servicio`);

--
-- Indices de la tabla `users_table`
--
ALTER TABLE `users_table`
  ADD PRIMARY KEY (`user_id`);

--
-- Indices de la tabla `usuarios_login`
--
ALTER TABLE `usuarios_login`
  ADD PRIMARY KEY (`ID_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `users_table`
--
ALTER TABLE `users_table`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
