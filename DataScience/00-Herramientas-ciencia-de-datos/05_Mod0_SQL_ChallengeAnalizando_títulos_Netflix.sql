# usar schema masterds
USE masterds;
SHOW tables;

# mostrar la tabla
SELECT *
FROM masterds.netflix_titles;

# 1 Selecciona las columnas type, title, director y country. Devuélvelas en una misma tabla.
SELECT type, title, directory, country
FROM netflix_titles;

# 2 En la columna 'type' parece haber dos categorías 'Movies' y 'TV Shows'. 
#¿Cuántos títulos tenemos de cada tipo?

SELECT type, COUNT(*)
FROM masterds.netflix_titles
GROUP BY type;


# 3 ¿Cuál es el país con la película más reciente en la base de datos 
# (año de lanzamiento más reciente)?
SELECT country, max(release_year)
FROM netflix;


# 4 ¿Cuál es el título y el director de la película más antigua en la base de datos?
SELECT title, director, min(release_year)
FROM netflix;


# 5 ¿Cuáles series tiene solo 1 temporada (1 Season)? 
# Queremos conocer solo el título, cast y rating.
SELECT title, cast, rating
FROM netflix
WHERE duration = "1 Season";


# 6 Ha sido un día largo y queremos ver algo que nos haga reír. 
#¿Acaso habrá algún título que solo esté en la categoría 
#'Comedies' y nada más?
SELECT title, listed_in, duration, description
FROM netflix
WHERE listed_in LIKE 'comedies';

# 7. Juguemos a ser un sistema de recomendación: 
# A nuestro usuario le encantan las películas, pero solo las más recientes. 
# Así que debes obtener el título, duración, descripción y año 
# de lanzamiento, pero solo de las primeras 30 películas más 
# recientes (debes ordenar de mayor a menor tus resultados).
SELECT title, duration, description, release_year
FROM netflix
WHERE duration LIKE '%min'
ORDER BY release_year DESC
LIMIT 30;

