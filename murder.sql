-- 1. Encontrar informações sobre testemunhas no relatório de cena do crime

SELECT *
FROM crime_scene_report
WHERE type = 'murder'
AND city = 'SQL City'
AND date = 20180115;

-- 2. Encontrar detalhes sobre as testemunhas na tabela de pessoa
SELECT *
FROM person
WHERE address_street_name = 'Northwestern Dr'
ORDER BY address_number DESC
LIMIT 1;

-- 2ª Testemunha: Annabel Miller (endereço em "Franklin Ave")
SELECT *
FROM person
WHERE address_street_name = 'Franklin Ave'
AND LOWER(name) LIKE '%annabel%';

-- 3. Consultar testemunhas na tabela de entrevistas

SELECT *
FROM interview
WHERE person_id IN (14887, 16371);

-- 4. Encontrar o assassino

SELECT p.*, ci.*
FROM drivers_license as dl
INNER JOIN person 
as p 
on dl.id = p.license_id
INNER JOIN get_fit_now_member 
as gf 
on p.id = gf.person_id
INNER JOIN get_fit_now_check_in 
as ci 
on gf.id = ci.membership_id
WHERE plate_number LIKE '%H42W%'
AND membership_status = 'gold'
AND check_in_date = 20180109;

-- 5. Consultar entrevista do assassino
SELECT *
FROM interview
WHERE person_id = 67318;

-- 6. Encontrar o mentor do crime

WITH CTE AS (
SELECT 
person_id,
COUNT(*) as visits
FROM facebook_event_checkin
WHERE date BETWEEN 20171201 AND 20171231
AND event_name = 'SQL Symphony Concert'
GROUP BY person_id
HAVING COUNT(*) >= 3)

SELECT p.*, fb.*
FROM drivers_license as dl
INNER JOIN person as p on dl.id = p.license_id
INNER JOIN CTE as fb on fb.person_id = p.id
WHERE hair_color = 'red'
AND height >= 65, AND height <= 67, AND car_make = 'Tesla', AND car_model = 'Model S',  AND gender = 'female';
