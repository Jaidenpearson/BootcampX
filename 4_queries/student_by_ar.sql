SELECT students.name AS student_name, COUNT(assistance_requests.id) AS total_requests
FROM assistance_requests
JOIN students ON assistance_requests.student_id = students.id
WHERE students.name = 'Elliot Dickinson'
GROUP BY students.name;