SELECT day, COUNT(id) AS total_assignments
FROM assignments 
GROUP BY day 
ORDER BY day;

SELECT day, COUNT(id) AS total_assignments
FROM assignments 
GROUP BY day 
HAVING COUNT(id) >= 10
ORDER BY day;

SELECT cohorts.name as cohort_name, count(students.*) AS student_count 
FROM cohorts
JOIN students ON cohorts.id = cohort_id
GROUP BY cohort_name 
HAVING count(students.*) >= 18
ORDER BY student_count;

SELECT cohorts.name AS cohort_name, count(assignment_submissions.*) AS total_submissions 
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assignment_submissions ON students.id = student_id
GROUP BY cohort_name
HAVING count(students.*) >= 18
ORDER BY total_submissions DESC;

SELECT students.name AS students, 
  AVG(assignment_submissions.duration) AS average_submission_time
FROM students
JOIN assignment_submissions 
  ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_submission_time DESC;

SELECT students.name AS students, 
  AVG(assignment_submissions.duration) AS average_submission_time,
  AVG(assignments.duration) AS average_estimated_time
FROM students
JOIN assignment_submissions 
  ON students.id = student_id
JOIN assignments ON assignment_submissions.assignment_id = assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING avg(assignment_submissions.duration) < avg(assignments.duration)
ORDER BY average_submission_time;