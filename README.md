# ☕ Coffee Quality Database Project

Este proyecto tiene como objetivo gestionar y analizar datos de calidad de cafés de diferentes regiones y tipos, basándose en tres conjuntos de datos: *Arabica*, *Robusta* y *Merged*. Utiliza MySQL como sistema gestor de base de datos.

---

## 📂 Estructura del Proyecto

/data
├── arabica_data_cleaned.csv
├── robusta_data_cleaned.csv
└── merged_data_cleaned.csv

/sql
├── 01_create_tables_mysql.sql
├── 02_load_data.sql
└── 03_objects.sql

/doc
└── Entrega2_Martin.pdf

---

## ⚙️ Requisitos

- MySQL Server
- Cliente SQL (Workbench, DBeaver, CLI, etc.)

---

## 🚀 Pasos para ejecutar el proyecto

1. **Preparación de datos:**
   - Descarga los archivos CSV desde SQL/data
   - Coloca los archivos en la carpeta `/data` del proyecto

2. **Carga de datos (2 opciones):**

   **Opción A - Usando scripts SQL:**
   ``sql
   -- Ejecutar en orden:
   1. ./sql/01_create_tables_mysql.sql
   2. ./sql/02_load_data.sql
   3. ./sql/03_objects.sql
   Nota: Asegúrate que la ruta '../data/' en 02_load_data.sql coincida con la ubicación real de tus archivos CSV.

   Opción B - Usando MySQL Workbench:

   Ejecuta 01_create_tables_mysql.sql

   Para cada archivo CSV:

   Click derecho en la tabla coffee_sample
   Seleccionar "Table Data Import Wizard"
   Seleccionar el archivo CSV correspondiente
   Configurar delimitador como ',' y enclosure como '"'
   Mapear columnas según corresponda
   Ejecuta 03_objects.sql

   Verificación:

   SELECT COUNT(*) FROM coffee_sample;

   Deberías ver registros de las tres fuentes de datos.  
