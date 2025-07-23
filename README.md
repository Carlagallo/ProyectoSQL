# ProyectoSQL

-- # ProyectoSQL
-- Primeras consultas realizadas

-- ========================================
-- 🔍 DataProject: Lógica de Consultas SQL
-- ========================================

-- 1️⃣ Mostrar los nombres de todas las películas con clasificación por edades 'R'
SELECT "title" AS "Título"
FROM "film"
WHERE "rating" = 'R';


-- 2️⃣ Encontrar los nombres de los actores con “actor_id” entre 30 y 40
SELECT 
  "actor_id" AS "ID", 
  "first_name" AS "Nombre", 
  "last_name" AS "Apellido"
FROM "actor"
WHERE "actor_id" BETWEEN 30 AND 40;


-- 3️⃣ Obtener las películas cuyo idioma coincide con el idioma original
SELECT 
  "title" AS "Título",
  "language_id" AS "Idioma",
  "original_language_id" AS "Idioma Original"
FROM "film"
WHERE "language_id" = "original_language_id";


-- 4️⃣ Ordenar las películas por duración (de menor a mayor)
SELECT 
  "title" AS "Nombre de la película",
  "length" AS "Duración"
FROM "film"
ORDER BY "length";


-- 5️⃣ Encontrar el nombre y apellido de los actores cuyo apellido es ‘Allen’
SELECT 
  "first_name" AS "Nombre",
  "last_name" AS "Apellido"
FROM "actor"
WHERE "last_name" = 'Allen';


-- 6️⃣ Contar la cantidad total de películas por clasificación
SELECT 
  "rating" AS "Clasificación",
  COUNT(*) AS "Cantidad de Películas"
FROM "film"
GROUP BY "rating";


-- 7️⃣ Obtener el título de las películas que sean ‘PG-13’ o duren más de 3 horas
SELECT 
  "title" AS "Película",
  "rating" AS "Clasificación",
  "length" AS "Duración"
FROM "film"
WHERE "rating" = 'PG-13' OR "length" > 180;


-- 8️⃣ Calcular la variabilidad del costo de reemplazo de las películas
SELECT 
  VAR_SAMP("replacement_cost") AS "Varianza del costo de reemplazo"
FROM "film";


-- 9️⃣ Encontrar la mayor y menor duración de una película
SELECT 	
  MIN("length") AS "Duración mínima",
  MAX("length") AS "Duración máxima"
FROM "film";


-- 🔟 Obtener el monto del antepenúltimo alquiler (ordenado por fecha)
SELECT 
  "r"."rental_date" AS "Fecha de alquiler",
  "p"."amount" AS "Monto pagado"
FROM "rental" AS "r"
JOIN "payment" AS "p" ON "r"."rental_id" = "p"."rental_id"
ORDER BY "r"."rental_date" DESC 
OFFSET 2
LIMIT 1;


-- 🔁 Listar los títulos de películas que NO sean ni ‘NC-17’ ni ‘G’
SELECT 
  "title" AS "Título",
  "rating" AS "Clasificación"
FROM "film"
WHERE "rating" NOT IN ('NC-17', 'G');
