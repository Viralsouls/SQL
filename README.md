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

1. **Crear la base de datos y las tablas:**
   ```sql
   Creados desde ./sql/01_create_tables_mysql.sql;

2. Cargar los datos desde los archivos CSV:

Asegúrate de tener los archivos .csv en la ruta correcta (/data).

Luego ejecuta: ./sql/02_load_data.sql;


3. Crear objetos de base de datos (vistas, funciones, procedimientos, triggers):

Ejecutar: ./sql/03_objects.sql;


📊 Vistas
avg_score_by_country
Descripción: Promedia el puntaje total por país de origen.

Tablas involucradas: coffee_sample.

high_defect_samples
Descripción: Muestra registros con defectos categoría 1 o 2 superiores a 10.

Tablas involucradas: coffee_sample.

🔧 Funciones
classify_quality(score FLOAT)
Descripción: Clasifica un puntaje como 'Excelente', 'Buena', etc.

Utiliza: Puntaje total (total_cup_points).

total_defects(cat1, cat2)
Descripción: Suma los defectos de categoría 1 y 2.

Utiliza: Campos category_one_defects, category_two_defects.

🛠️ Stored Procedures
get_samples_by_country(IN countryName)
Descripción: Lista los cafés por país.

Tablas involucradas: coffee_sample.

insert_coffee_basic(...)
Descripción: Inserta un nuevo registro con campos básicos.

Tablas involucradas: coffee_sample.

🚨 Triggers
check_score_before_insert
Descripción: Evita insertar un puntaje total mayor a 100.

Tabla afectada: coffee_sample.

log_insert_sample
Descripción: Registra inserciones en una tabla de auditoría.

Tablas: coffee_sample, audit_log.

📎 Notas adicionales
La base de datos se llama coffee_db y se crea automáticamente en el script 01.

Todos los scripts están preparados para funcionar sobre MySQL sin modificaciones adicionales.

Si se desea ejecutar importación directa desde un gestor gráfico, los .csv pueden ser importados manualmente desde la carpeta /data.
