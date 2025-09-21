# Proyecto SQL – Análisis de la Base de Datos DVD Rental

Este proyecto recoge una serie de **consultas SQL en PostgreSQL** realizadas sobre la base de datos de ejemplo **DVD Rental**.  
El objetivo fue practicar operaciones de selección, agregación, subconsultas, joins, creación de vistas y tablas temporales, así como análisis exploratorio de los datos.

## 🔧 Requisitos previos

- **PostgreSQL 13+** (compatible con otras versiones recientes)
- Cliente SQL (por ejemplo **DBeaver**, pgAdmin o psql)
- Base de datos de ejemplo "Tienda de peliculas"

## 📂 Estructura del repositorio

├── Consultas.sql # Archivo con todas las sentencias SQL
└── README.md # Este archivo


## 🚀 Pasos seguidos

1. **Carga de la base de datos**  
   - Restauración del backup `BBDD_Proyecto.sql` en PostgreSQL.

2. **Diseño de las consultas**  
   - Se elaboraron **64 ejercicios** que cubren:
     - Filtrado con `WHERE`, `BETWEEN`, `IN`, `NOT IN`, `LIKE`
     - Funciones de agregación (`COUNT`, `AVG`, `SUM`, `VARIANCE`, etc.)
     - Agrupaciones y filtros con `GROUP BY` y `HAVING`
     - Distintos tipos de joins: `INNER`, `LEFT`, `RIGHT`, `CROSS`
     - Subconsultas y expresiones escalares
     - Creación de **vistas** (`CREATE VIEW`) y **tablas temporales** (`CREATE TEMP TABLE`)

3. **Pruebas en DBeaver**  
   - Se ejecutaron y verificaron todas las consultas asegurando compatibilidad con PostgreSQL.

## 🗂 Informe de Análisis

A partir de las consultas se obtuvieron, entre otros resultados:

- **Películas**  
  - Identificación de las más largas (>180 min) y su varianza de costo de reemplazo.
  - Media de duración por clasificación (`rating`).

- **Actores y participación**  
  - Listado de actores con mayor número de películas.
  - Actores que no han actuado en ninguna película.

- **Clientes y rentas**  
  - Top 5 de clientes por gasto total.
  - Clientes que han alquilado al menos 7 películas distintas.

- **Categorías y rentas**  
  - Cantidad total de alquileres por categoría.
  - Promedio de duración de películas por categoría.

- **Vistas y tablas temporales**  
  - `vista_actor_num_peliculas`: actores y número de películas en que han participado.
  - `cliente_rentas_temporal`: total de alquileres por cliente.
  - `peliculas_alquiladas`: películas alquiladas al menos 10 veces.

## 💡 Observaciones

- La base de datos incluye múltiples relaciones N-a-N (por ejemplo `film_actor`, `film_category`), lo que permite ejercicios complejos de joins.
- Para análisis más profundos (por ejemplo, ingresos por categoría y mes) pueden combinarse varias de las vistas creadas.


```bash
\i Consultas.sql

