# Write your MySQL query statement below
SELECT DISTINCT num AS ConsecutiveNums
FROM (
    SELECT 
        num,
        LAG(num, 1) OVER (ORDER BY id) AS prev_num,
        LEAD(num, 1) OVER (ORDER BY id) AS next_num,
        LAG(id, 1) OVER (ORDER BY id) AS prev_id,
        LEAD(id, 1) OVER (ORDER BY id) AS next_id,
        id
    FROM Logs
) t
WHERE num = prev_num 
  AND num = next_num
  AND id = prev_id + 1
--   AND id = next_id - 1;