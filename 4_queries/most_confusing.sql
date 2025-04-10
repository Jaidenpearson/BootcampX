SELECT assignments.id AS assignment_id, assignments.day AS assignment_day, assignments.chapter AS assignment_chapter, assignments.name AS assignment_name, COUNT(assistance_requests.id) AS total_assistances
FROM assistance_requests
JOIN assignments ON assistance_requests.assignment_id = assignments.id
GROUP BY assignments.id, assignments.day, assignments.chapter, assignments.name
ORDER BY total_assistances DESC;