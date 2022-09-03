# CHALLENGE 2
USE masterds;

# 1 Utiliza un INNER JOIN para cruzar la tablas `cities` y `countries`.
# 
# Selecciona el nombre de la ciudad (con alias 'city'), el código de país, 
# el nombre del país (con alias 'country') y la columna city_prop_population 
# (población propia de la ciudad). Finalmente, ordena en orden descendente 
# por la columna que ambas tablas tienen en común.

SELECT *
FROM cities;

SELECT *
FROM countries;

# NOTA: ambas comparten el country code
SELECT cities.name AS city, countries.code AS code_country, countries.country_name AS country, countries.region , cities.city_proper_pop
FROM cities INNER JOIN countries
ON cities.country_code = countries.code
ORDER BY countries.code DESC;


# 2 Utiliza un LEFT JOIN para cruzar la tablas `countries` y `languages`.
#
# Selecciona el país (con alias 'country'), el nombre local del país (local_name), 
# el nombre del idioma y, finalmente, el porcentaje del idioma hablado en cada país

SELECT *
FROM lang;

SELECT *
FROM countries; 

SELECT countries.country_name AS country, countries.local_name AS local_name, lang.name AS languages, lang.percent AS porcentaje
FROM countries LEFT JOIN lang
ON lang.code = countries.code
ORDER BY countries.country_name DESC;


# 3 Utiliza nuevamente un LEFT JOIN (o RIGHT JOIN si quiere alocarte un poco 🤓) 
# para cruzar las tablas `countries` y `economies`.
#
# Selecciona el nombre del país, región y GDP per cápita (de `economies`). 
# Finalmente, filtra las filas para obtener solo los resultados del año 2010.

SELECT *
FROM economies; 

SELECT *
FROM countries; 

SELECT countries.country_name AS country, countries.region AS region, economies.gdp_percapita AS gdp, economies.year AS year
FROM countries LEFT JOIN economies
ON economies.code = countries.code
where economies.year = 2010;


# 4 Veamos si aprendiste la diferencia entre LEFT JOIN y RIGHT JOIN. 
# Convierte el siguiente ejemplo para utilizar RIGHT JOINs pero obteniendo el mismo resultado.

SELECT *
FROM cities;

SELECT *
FROM lang;

SELECT *
FROM countries;

## SUBCONSULTA TABLA 1
# union de las bases de datos de cities y country LEFT JOIN, se llamara tabla1
SELECT cities.name AS city, countries.country_name, countries.indep_year, cities.urbanarea_pop, countries.code
FROM cities LEFT JOIN countries
ON cities.country_code = countries.code;

## Primer intento
# integrar tabla1 en esta nuevo JOIN usando RIGHT
SELECT tabla1.city, tabla1.urbanarea_pop, tabla1.country_name, tabla1.indep_year, lang.name AS languages, lang.percent
FROM lang RIGHT join (SELECT cities.name AS city, countries.country_name, countries.indep_year, cities.urbanarea_pop, countries.code
FROM cities LEFT JOIN countries
ON cities.country_code = countries.code) AS tabla1 
ON lang.code = tabla1.code;


    
# 5 Has una subconsulta en WHERE donde calcules el promedio de 
# la expectativa de vida en la tabla `populations`, filtrando solo para el año 2015.

SELECT *
FROM populations;

# subconsulta
SELECT pop_id, country_code, year, avg(life_expectancy) AS Average_life_expectancy
FROM populations
WHERE year = '2015';


# NOTA: Hace falta mayor informacion en la pregunta. 
# No menciona la multiplicacion con 1.15 a la esperanza de vida
SELECT * 
FROM populations
WHERE life_expectancy > 1.15*(SELECT avg(life_expectancy) AS Average_life_expectancy
FROM populations
WHERE year = 2015) AND year = 2015;

    
