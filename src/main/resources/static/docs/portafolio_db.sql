CREATE DATABASE IF NOT EXISTS portafolio_db;
USE portafolio_db;

CREATE TABLE IF NOT EXISTS proyectos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    descripcion TEXT NOT NULL,
    tecnologias VARCHAR(200) NOT NULL,
    url_github VARCHAR(255) NOT NULL);

-- Datos de prueba iniciales
INSERT INTO proyectos (titulo, descripcion, tecnologias, url_github) VALUES
('Sistema de Reservación y mapeo', 'Aplicación web para administración de reservaciones, parques, etc.', 'Python', 'https://github.com/YamilSalazar/Prisma.git'),
('App Móvil de Psicología', 'Plataforma para agendar citas terapéuticas y consultar reseñas de especialistas.', 'React Native, Expo, PostgreSQL', 'https://github.com/drax3l/clinicamente_app_frontend.git'),
('Analizador de Datos de Salud', 'Clustering y visualización interactiva de datos públicos de salud.', 'Python, Pandas, Quarto', 'https://github.com/DanielaSanluis/ProyectoFinalAMdD.git');

USE portafolio_db;
select * from proyectos;