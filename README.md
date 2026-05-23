# 🚀 CiviBot: Escuela de Civismo Digital e IA

Sistema multiplataforma desarrollado en **Java EE (JSP)** y **MySQL** enfocado en estudiantes de educación básica (primaria y secundaria). El objetivo principal de **CiviBot** es guiar a los alumnos en el uso responsable, ético y seguro de las herramientas de Inteligencia Artificial Generativa.

Desarrollar e implementar un software web denominado "CiviBot: Escuela de Civismo Digital" como una plataforma de enseñanza multiplataforma que permita la gestión, consulta y despliegue interactivo de tips, consejos y normatividades sobre el uso responsable de Inteligencia Artificial Generativa para estudiantes de primaria y secundaria, utilizando el lenguaje de programación Java y el motor de bases de datos MySQL para promover la seguridad informática desde la escuela.

---

## 🛠️ Software y Herramientas Utilizadas

Para el ciclo de vida completo de este software se emplearon las siguientes herramientas profesionales:
* **GanttProject:** Planificación del cronograma y control de tiempos de desarrollo.
* **ArgoUML:** Modelado del diagrama de clases y arquitectura orientada a objetos (POO).
* **Balsamiq Wireframes:** Prototipado y diseño de experiencia de usuario (UX/UI).
* **NetBeans IDE & GlassFish Server:** Entorno de desarrollo y servidor web para el despliegue de las páginas JSP.
* **XAMPP / phpMyAdmin:** Gestión y persistencia de la base de datos relacional MySQL.

---

## 📦 Estructura del Proyecto

El sistema está organizado bajo buenas prácticas de desarrollo web en Java, separando las vistas de la lógica de conexión:

* `web/`
  * `index.jsp` -> Pantalla de acceso seguro (Login de CiviBot) con validación de roles.
  * `principal.jsp` -> Dashboard dinámico de aprendizaje que genera tarjetas basadas en la base de datos.
  * `detalle.jsp` -> Ficha pedagógica interactiva que despliega ejemplos prácticos según el recurso seleccionado.
  * `admin.jsp` -> Panel de administración con operaciones de lectura de datos y uso de arreglos lógicos.
* `src/`
  * `conexion/ConexionBD.java` -> Clase encapsulada para la gestión del pool de conexiones JDBC hacia MySQL.

---

## 💾 Modelo de Datos (MySQL)

La persistencia de la información requiere una base de datos llamada `plataforma_ia` compuesta por las siguientes tres tablas:
1. `usuarios` (Control de accesos y credenciales).
2. `categorias` (Clasificación pedagógica de los lineamientos).
3. `recursos_ia` (Repositorio dinámico de consejos y normativas escolares).

---

## 👤 Credenciales de Acceso para Pruebas

El sistema cuenta con cuentas preconfiguradas para validar el control de flujo y vistas de roles dentro de CiviBot:
* **Rol Administrador:** `admin@gmail.com` | Contraseña: `1234`
* **Rol Estudiante/Lector:** `alumno@escuela.com` | Contraseña: `1234`
