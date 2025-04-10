SELECT teachers.name AS teacher_name, COUNT(assistance_requests.id) AS total_requests
FROM assistance_requests
JOIN teachers ON assistance_requests.teacher_id = teachers.id
WHERE teachers.name = 'Waylon Boehm'
GROUP BY teachers.name;