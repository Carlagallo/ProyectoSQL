-- # ProyectoSQL -- Primeras consultas realizadas

-- ======================================== -- 🔍 DataProject: Lógica de Consultas SQL -- ========================================

-- 2 Mostrar los nombres de todas las películas con clasificación por edades 'R'

SELECT title AS "Título" 
FROM film 
WHERE rating = 'R';

-- 3 Encontrar los nombres de los actores con “actor_id” entre 30 y 40 

SELECT 
	actor_id AS "ID", 
	first_name AS "Nombre", 
	last_name AS "Apellido" 
FROM actor
WHERE actor_id BETWEEN 30 AND 40;

-- 4 Obtener las películas cuyo idioma coincide con el idioma original 

SELECT 
	title AS "Título", 
	language_id AS "Idioma", 
	original_language_id AS "Idioma Original" 
FROM film
WHERE language_id = "original_language_id";

-- 5. Ordena las películas por duración de forma ascendente.

SELECT 
	title AS "Nombre de la película", 
	length AS "Duración" 
FROM "film" 
ORDER BY "length";

-- 6 Encontrar el nombre y apellido de los actores cuyo apellido es ‘Allen’ 

SELECT 
	first_name AS "Nombre", 
	last_name AS "Apellido" 
FROM actor
WHERE LOWER(last_name) = LOWER('Allen');

-- 7. Encuentra la cantidad total de películas en cada clasificación de la tabla “film” y muestra la clasificación junto con el recuento.

SELECT 
	"rating" AS "Clasificación", COUNT(*) AS "Cantidad de Películas" 
FROM "film" 
GROUP BY "rating";

-- 8. Encuentra el título de todas las películas que son ‘PG-13’ o tienen una duración mayor a 3 horas en la tabla film.
SELECT 
	title AS "Película", 
	rating AS "Clasificación", 
	length AS "Duración" 
FROM film 
WHERE rating = 'PG-13' OR length > 180;

-- 9. Encuentra la variabilidad de lo que costaría reemplazar las películas.

SELECT VAR_SAMP(replacement_cost) AS "Varianza del costo de reemplazo" 
FROM film;

-- 10. Encontrar la mayor y menor duración de una película 

SELECT 
MIN(length) AS "Duración mínima", 
MAX(length) AS "Duración máxima" 
FROM film;

-- 11. Encuentra lo que costó el antepenúltimo alquiler ordenado por día.

SELECT 
R.rental_date AS "Fecha de alquiler", 
P.amount AS "Monto pagado" 
FROM rental AS R 
JOIN payment AS P 
	ON R.rental_id = P.rental_id
ORDER BY R.rental_date DESC OFFSET 2 
LIMIT 1;

--  12. Encuentra el título de las películas en la tabla “film” que no sean ni ‘NC-17’ ni ‘G’ en cuanto a su clasificación.’ 

SELECT 
	title AS "Título", 
	rating AS "Clasificación" 
FROM film
WHERE rating NOT IN ('NC-17', 'G');

-- 13. Encuentra el promedio de duración de las películas para cada clasificación de la  tabla film y muestra la clasificación junto con el promedio de duración.Encuentra el promedio de duración de las películas para cada clasificación de la tabla film y muestra la clasificación junto con el promedio de duración.

select rating as "Clasificación",
	Round(AVG(length), 2) as "promedio de duración"
from film as "Película"
group by rating
order by rating;

-- 14.Encuentra el título de todas las películas que tengan una duración mayor a 180 minutos.
select title as "titulo",
		length as "Duración"
from film
where length >180
order by length 


-- 15. ¿Cuánto dinero ha generado en total la empresa?

select SUM(amount) as "Total generado"
from payment;

-- 16. Muestra los 10 clientes con mayor valor de id.

select customer_id as "Cliente"
from customer
order by customer_id DESC 
limit 10;

-- 17. Encuentra el nombre y apellido de los actores que aparecen en la película con título ‘Egg Igby’

select A.first_name AS nombre,
       A.last_name  AS apellido,
       F.title 
from film as F
inner JOIN film_actor as FA 
	ON F.film_id  = FA.film_id
inner JOIN actor as A 
	ON FA.actor_id = A.actor_id
WHERE LOWER(f.title) = LOWER('Egg Igby');

-- 18. Selecciona todos los nombres de las películas únicos.

select distinct title as "Título"
from "film";ayor a 180 minutos en la tabla “film”


-- 20.XXXXXXX  Encuentra las categorías de películas que tienen un promedio de duración superior a 110 minutos
 y muestra el nombre de la categoría junto con el promedio de duración.

SELECT
	C.name as "Categoría",
	C.category_id as "ID"
FROM category as C
inner join film_category as FCT
on FCT.category_id = C.category_id


 -- 21. ¿Cuál es la media de duración del alquiler de las películas?

select 
	AVG (return_date - rental_date) as "duración _alquiler"
from "rental"


-- 22. Crea una columna con el nombre y apellidos de todos los actores y actrices.
select 
	"first_name"||' '||"last_name"as "Nombre_apellido"
from "actor";

-- 23. Números de alquiler por día, ordenados por cantidad de alquiler de forma descendente.

SELECT 
    DATE("rental_date") AS dia,
    COUNT(*) AS cantidad_alquileres
FROM "rental"
GROUP BY DATE("rental_date")
ORDER BY cantidad_alquileres DESC;


-- 24.  Encuentra las películas con una duración superior al promedio.
select 
	lengt as "Duración",
	title as "Película"
from film
where length > 
		(
		select AVG(length)
		from film
		)
order by length desc;


-- 25. Averigua el número de alquileres registrados por mes.

select 
    extract(YEAR FROM rental_date) AS "año",
   extract(MONTH FROM rental_date) AS "mes",
    COUNT(*) AS "cantidad_alquileres"
from rental
GROUP BY "año", "mes"
ORDER BY "año", "mes";


-- 26. Encuentra el promedio, la desviación estándar y varianza del total pagado.

select 
	round(AVG("amount"), 2) as "Promedio_pago",
	round(stddev("amount"), 2) as "Desviación_estandar",
	round(variance("amount"), 2) as "Varianza"
from "payment";


-- 27. ¿Qué películas se alquilan por encima del precio medio?
select 
	"title" as "Película",
	"rental_rate" as "Precio_alquiler"
from "film"
where "rental_rate" > 
		(
		select AVG("rental_rate")
		from "film"
		)
order by "rental_rate" DESC;

-- 28. Muestra el id de los actores que hayan participado en más de 40 películas.

select 
	"actor_id",
	COUNT("film_id") as "Cantidad_de_películas"
from "film_actor" 
group by "actor_id"
having COUNT("film_id") > 40
order by "Cantidad_de_películas"

-- 29. Obtener todas las películas y, si están disponibles en el inventario, mostrar la cantidad disponible.

select 
	F."title",
	F."film_id",
	COUNT(I.inventory_id) as "Disponibles"
from "film" as F
inner join "inventory" as I
	on I."film_id" = F."film_id"
left join "rental" as R
	on R."inventory_id" = I."inventory_id"
	and R.return_date is null 
group by F.title, F.film_id
order by "Disponibles";


-- 30. Obtener los actores y el número de películas en las que ha actuado.
select 
	A.first_name as "Nombre", 
	A.last_name as "Apellido",
	COUNT(f.film_id) as "Cantidad_de_peliculas_actuadas"
from actor as A
inner join film_actor as FA
	on A.actor_id = FA.actor_id
left join Film as F
	on F.film_id = FA.film_id
group by A.actor_id, A.first_name, A.last_name; 



--31.  Obtener todas las películas y mostrar los actores que han actuado en ellas, incluso si algunas películas no tienen actores asociados.

SELECT 
    F.title AS "Película",
    A.first_name AS "Nombre",
    A.last_name AS "Apellido"
FROM "film" AS F
LEFT JOIN "film_actor" AS FA
    ON F.film_id = FA.film_id
LEFT JOIN "actor" AS A
    ON A.actor_id = FA.actor_id
GROUP BY F.title, A.first_name, A.last_name
ORDER BY F.title;

-- 32. Obtener todos los actores y mostrar las películas en las que han actuado, incluso si algunos actores no han actuado en ninguna película.

select 
	A.first_name as "Nombre", 
	A.last_name as "Apellido",
	F.title as "Película"
from actor as A
left join film_actor as FA
	on A.actor_id = FA.actor_id
left join Film as F
	on F.film_id = FA.film_id
group by A.first_name, A.last_name, F.title;


-- 33. Obtener todas las películas que tenemos y todos los registros de alquiler.

select 
	F.title,
	R.rental_date
from film as F
left join inventory as I 
	on i.film_id = F.film_id
left join rental as R 
	on R.inventory_id = I.inventory_id
order by F.title, R.rental_date;

-- 34. Encuentra los 5 clientes que más dinero se hayan gastado con nosotros.
select 
	C.first_name,
	C.last_name,
	C.email,
	SUM(P.amount) as "Total_gastado"
from customer as C
inner join payment as P
	on P.customer_id = C.customer_id
group by C.first_name, C.last_name, C.email
order by "Total_gastado"  DESC
limit 5;


-- 35. Selecciona todos los actores cuyo primer nombre es ' Johnny'.
select 
	first_name, 
	last_name 
from actor 
where LOWER(first_name) = LOWER('Johnny');


-- 36. Renombra la columna “first_name” como Nombre y “last_name” como Apellido.
select 
	first_name as "Nombre",
	last_name as "Apellido"
from actor;

-- 37. Encuentra el ID del actor más bajo y más alto en la tabla actor.

select 
	MIN(actor_id) as "id_más_bajo",
	MAX(actor_id) as "id_más_alto"
from actor;

SELECT 
	first_name as "Nombre",
	last_name as "Apellido",
	actor_id
FROM actor
WHERE actor_id = (SELECT MIN(actor_id) 
	FROM actor)
   	OR actor_id = (SELECT MAX(actor_id) 
	FROM actor);


-- 38. Cuenta cuántos actores hay en la tabla “actor”

select 
	COUNT(actor_id)
from actor;

-- 39. Selecciona todos los actores y ordénalos por apellido en orden ascendente.

select 
	last_name as "Apellido",
	first_name as "Nombre",
	actor_id,
	last_update 
from actor 
order by last_name;


-- 40. Selecciona las primeras 5 películas de la tabla “film”

select *
from film 
limit 5;

--- COMENTARIO: La consigna es ambigua y creo que la consulta arriba mencionada finciona, pero para cumplir con buenas practicas y tener una consulta más limpia creo que deberiamos usar: 

select 
	film_id, 
	title, 
	description, 
	release_year
from  film
order by film_id   
limit 5;

-- 41. Agrupa los actores por su nombre y cuenta cuántos actores tienen el mismo nombre. ¿Cuál es el nombre más repetido?

select 
	first_name, 
	COUNT(*)  as "cantidad"
from actor
group by first_name 
order by "cantidad" desc;


-- 42. Encuentra todos los alquileres y los nombres de los clientes que los realizaron.

select 	
	R.rental_id,
	C.first_name as "Nombre",
	c.last_name as "Apellido"
from rental as R
left join customer as C
	on C.customer_id = R.customer_id
order by R.rental_id;
	
-- 43. Muestra todos los clientes y sus alquileres si existen, incluyendo aquellos que no tienen alquileres.

select 
	C.customer_id,
	C.first_name as "Nombre",
	C.last_name as "Apellido",
	R.rental_id
from customer as C
left join rental as R
	on R.customer_id = C.customer_id
order by C.customer_id;


-- 44. Realiza un CROSS JOIN entre las tablas film y category. ¿Aporta valor esta consulta? ¿Por qué? Deja después de la consulta la contestación.

select *
from film as F
cross join category as Cat

--- COMENTARIO: No es un cruce que aporte valor ya que existe una tabla que es film_category que permitíria cruces con más valor, de ser necesarios. Este tipo de cruces genera una consulta muy pesada que podría relentizarla y hacerla de poca usabilidad. 


-- 45. Encuentra los actores que han participado en películas de la categoría 'Action'.

select 
	A.first_name as "Nombre",
	A.last_name as "Apellido",
	CAT."name" as "Categoría"
from actor as A
inner join film_actor as FA
	on FA.actor_id = A.actor_id
inner join film as F
	on FA.film_id = FA.film_id 
inner join film_category as FCAT
	on FA.film_id = FCAT.film_id
inner join category as CAT
	on CAT.category_id = FCAT.category_id
where LOWER(CAT.name) = LOWER('Action');


-- 46. Encuentra todos los actores que no han participado en películas.

SELECT 
    a.actor_id,
    a.first_name,
    a.last_name
FROM actor AS a
LEFT JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
WHERE fa.actor_id IS NULL;


-- 47. Selecciona el nombre de los actores y la cantidad de películas en las que han participado.
SELECT
    a.first_name,
    a.last_name,
    COUNT(fa.film_id) AS total_peliculas
FROM actor AS a
INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY total_peliculas DESC;


-- 48. Crea una vista llamada “actor_num_peliculas” que muestre los nombres de los actores y el número de películas en las que han participado.

 ---------- > vista creada con el nombre vist_actor_num_peliculas

-- 49. Calcula el número total de alquileres realizados por cada cliente.

select 
	customer_id,
	COUNT(rental_id) as "alquileres_realizados"
from rental
group by customer_id
order by customer_id;

-- 50. Calcula la duración total de las películas en la categoría 'Action'.

select 
	Cat.name as "Categoría",
	SUM(F.length) as "Duración total"
from category  as Cat
inner join film_category as FCat
	on FCat.category_id = Cat.category_id
inner join film as F
	on F.film_id = FCat.film_id
where Cat."name" = 'Action'
group by "Categoría";



-- 51. Crea una tabla temporal llamada “cliente_rentas_temporal” para almacenar el total de alquileres por cliente.

CREATE TEMP TABLE cliente_rentas_temporal AS
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_alquileres
FROM customer AS c
INNER JOIN rental AS r
    ON c.customer_id = r.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;

SELECT * FROM cliente_rentas_temporal;


-- 52. Crea una tabla temporal llamada “peliculas_alquiladas” que almacene las películas que han sido alquiladas al menos 10 veces.

CREATE TEMP TABLE peliculas_alquiladas AS
SELECT
    f.film_id,
    f.title,
    COUNT(r.rental_id) AS total_rentas
FROM film AS f
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
HAVING COUNT(r.rental_id) >= 10;

SELECT * FROM peliculas_alquiladas;

-- 53. Encuentra el título de las películas que han sido alquiladas por el cliente con el nombre ‘Tammy Sanders’ y que aún no se han devuelto. Ordena los resultados alfabéticamente por título de película.

select
 	C.first_name AS "Nombre",
    C.last_name  AS "Apellido",
    F.title as "Título"
from customer as C
inner join rental as R
   on C.customer_id = R.customer_id
inner join inventory AS I
    ON R.inventory_id = I.inventory_id
inner join film AS F
    ON I.film_id = F.film_id
where LOWER(C.first_name) = LOWER('Tammy')
  and LOWER(C.last_name)  = LOWER('Sanders')
  and R.return_date IS NULL
order by f.title;


-- 54. Encuentra los nombres de los actores que han actuado en al menos una película que pertenece a la categoría ‘Sci-Fi’. Ordena los resultados alfabéticamente por apellido.

select distinct
    a.first_name as "Nombre",
    a.last_name  as "Apellido",
    c."name" as "Categoría"
from actor as a
inner join film_actor as fa
    on a.actor_id = fa.actor_id
inner join film as f
    on fa.film_id = f.film_id
inner join film_category as fc
    on f.film_id = fc.film_id
inner join category as c
    on fc.category_id = c.category_id
where c.name = 'Sci-Fi'
order by a.last_name, a.first_name;


-- 55. Encuentra el nombre y apellido de los actores que han actuado en películas que se alquilaron después de que la película ‘Spartacus Cheaper’ se alquilara por primera vez. Ordena los resultados alfabéticamente por apellido.

SELECT DISTINCT
    a.first_name AS "Nombre",
    a.last_name  AS "Apellido"
FROM actor AS a
INNER JOIN film_actor AS fa
    ON a.actor_id = fa.actor_id
INNER JOIN film AS f
    ON fa.film_id = f.film_id
INNER JOIN inventory AS i
    ON f.film_id = i.film_id
INNER JOIN rental AS r
    ON i.inventory_id = r.inventory_id
WHERE r.rental_date >
      (
        SELECT MIN(r2.rental_date)
        FROM film AS f2
        INNER JOIN inventory AS i2
            ON f2.film_id = i2.film_id
        INNER JOIN rental AS r2
            ON i2.inventory_id = r2.inventory_id
        WHERE LOWER(f2.title) = LOWER('Spartacus Cheaper')
      )
ORDER BY a.last_name, a.first_name;

-- 56. Encuentra el nombre y apellido de los actores que no han actuado en ninguna película de la categoría ‘Music’

select
    A.first_name,
    A.last_name
from actor as a
left join film_actor as fa
    on a.actor_id = fa.actor_id
where fa.film_id IS NULL;


-- 57. Encuentra el título de todas las películas que fueron alquiladas por más de 8 días.

select 
	F.title as "Titulo",
	(R.return_date - R.rental_date) as "Duración_del_alquiler"
from film as F
inner join inventory as I
	on F.film_id = I.film_id
inner join rental as R
	on I.inventory_id = R.inventory_id
where extract(day from(R.return_date - R.rental_date))> 8
order by "Duración_del_alquiler" desc;


-- 58. Encuentra el título de todas las películas que son de la misma categoría que ‘Animation’.

select
	F.title  as "Título",
	C.name as "Categoría"
from Film as F
inner join film_category as FCAT
	on F.film_id = FCAT.film_id
inner join category as C
	on C.category_id = FCAT.category_id
where LOWER(C.name) = LOWER('Animation');


-- 59. Encuentra los nombres de las películas que tienen la misma duración que la película con el título ‘Dancing Fever’. Ordena los resultados alfabéticamente por título de película.
select 
	F.title as "Titulo",
	F.length as "Duración"
from film as F
where length = (
		select f2.length  
		from film as f2
		where LOWER(f2.title) = LOWER('Dancing Fever')
		)
	order by f.title;

-- 60. Encuentra los nombres de los clientes que han alquilado al menos 7 películas distintas. Ordena los resultados alfabéticamente por apellido.

SELECT
	cst.first_name,
	cst.last_name
FROM rental AS rnt
INNER JOIN inventory AS inv
	ON rnt.inventory_id = inv.inventory_id
INNER JOIN customer AS cst
	ON rnt.customer_id = cst.customer_id
GROUP BY cst.customer_id
HAVING COUNT(DISTINCT film_id) >= 7
ORDER BY cst.last_name ASC;


-- 61. Encuentra la cantidad total de películas alquiladas por categoría y 
muestra el nombre de la categoría junto con el recuento de alquileres.

select 
	C.name as "Categoría",
	COUNT(*) as "Recuento_alquieres"
from rental as R
inner join inventory as I
	on I.inventory_id = R.inventory_id
inner join film as F
	on F.film_id = I.film_id
inner join film_category as FC
	on FC.film_id = F.film_id
inner join category as C
	on C.category_id = FC.category_id
group by C.name
order by "Recuento_alquieres";


-- 62. Encuentra el número de películas por categoría estrenadas en 2006.

select 
	C."name" as "Categoría",
	COUNT(F.release_year) as "cantidad_de_películas"
from category as C
inner join film_category as FC
	on FC.category_id = C.category_id
inner join film as F
	on F.film_id = FC.film_id
where F.release_year = '2006' 
group by C."name"
order by "cantidad_de_películas";

-- 63. Obtén todas las combinaciones posibles de trabajadores con las tiendas que tenemos.

select
    S.staff_id,
    S.first_name || ' ' || s.last_name as "Empleado",
    ST.store_id,
    ST.address_id
from staff as S
cross join store as ST
order by S.staff_id , ST.store_id;


-- 64. Encuentra la cantidad total de películas alquiladas por cada cliente y muestra el ID del cliente, su nombre y apellido junto con la cantidad de películas alquiladas.
SELECT
	cst.customer_id,
	cst.first_name,
	cst.last_name,
	COUNT(inv.film_id) AS Alquiladas
FROM rental AS rnt
INNER JOIN inventory AS inv
	ON rnt.inventory_id = inv.inventory_id
INNER JOIN customer AS cst
	ON rnt.customer_id = cst.customer_id
GROUP BY cst.customer_id, cst.first_name, cst.last_name;

