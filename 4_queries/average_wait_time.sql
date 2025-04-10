SELECT 
  AVG(completed_at - created_at) AS average_total_duration
FROM assistance_requests;