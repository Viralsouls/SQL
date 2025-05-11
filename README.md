# Proyecto de Base de Datos: Análisis de Café

Este proyecto consiste en el modelado y construcción de una base de datos relacional que permite almacenar, analizar y consultar datos sobre muestras de café de distintas fincas y países.

## 📁 Estructura del Repositorio

```
proyecto_base_datos_cafe/
│
├── sql/                   # Scripts SQL de creación, inserción y objetos
│   ├── 01_create_schema.sql
│   ├── 02_insert_data.sql
│   └── 03_objects.sql
│
├── data/                  # Archivos CSV u otros utilizados para la carga de datos
│
├── diagrams/              # Diagramas E-R y otros visuales
│   └── coffee_er_diagram.png
│
├── docs/                  # Documentación PDF
│   └── Entrega2_Apellido.pdf
│
└── README.md              # Documentación principal del repositorio
```

## 📝 Contenido del Proyecto

- **Diagrama Entidad-Relación (E-R)** con al menos 8 relaciones.
- **Scripts de creación de tablas**, relaciones y restricciones.
- **Vistas, Funciones, Stored Procedures y Triggers**.
- **Datos de ejemplo** para realizar consultas y pruebas.
- **Documentación en PDF** con análisis del proyecto, objetivo, problemática y modelo de negocio.

## 🛠️ Requisitos Técnicos

- SQL estándar compatible con PostgreSQL / MySQL
- Editor recomendado: DBeaver, pgAdmin o MySQL Workbench

## 🚀 Ejecución

1. Ejecutar `01_create_schema.sql` para crear la base de datos y sus tablas.
2. Ejecutar `02_insert_data.sql` para cargar los datos de ejemplo.
3. Ejecutar `03_objects.sql` para crear vistas, funciones, procedimientos y triggers
