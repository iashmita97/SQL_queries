# Write your MySQL query statement below
SELECT w.id
FROM Weather w
JOIN Weather y
ON DATEDIFF(w.recordDate, y.recordDate) = 1
WHERE w.temperature > y.temperature;