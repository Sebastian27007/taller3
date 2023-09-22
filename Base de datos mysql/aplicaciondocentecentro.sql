-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2023 a las 22:32:25
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
-- Estructura de tabla para la tabla `login administrador`
--

CREATE TABLE `login administrador` (
  `ID_admin` int(11) NOT NULL,
  `Correo electronico` varchar(60) NOT NULL,
  `Contraseña` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login usuario`
--

CREATE TABLE `login usuario` (
  `ID_usuario` int(11) NOT NULL,
  `Correo electronico` varchar(60) DEFAULT NULL,
  `Contraseña` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asesores`
--
ALTER TABLE `asesores`
  ADD PRIMARY KEY (`ID_asesor`);

--
-- Indices de la tabla `login administrador`
--
ALTER TABLE `login administrador`
  ADD PRIMARY KEY (`ID_admin`);

--
-- Indices de la tabla `login usuario`
--
ALTER TABLE `login usuario`
  ADD PRIMARY KEY (`ID_usuario`);

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
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
