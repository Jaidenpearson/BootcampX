SELECT name, email, id, cohort_id 
FROM students 
WHERE email NOt LIKE '%@gmail.com'
AND phone IS NULL;