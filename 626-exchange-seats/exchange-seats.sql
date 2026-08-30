# Write your MySQL query statement below
SELECT 
    id,
    CASE 
        -- If even, take the student from the previous row
        WHEN id % 2 = 0 THEN LAG(student) OVER (ORDER BY id)
        -- If odd, take the student from the next row (or keep current if it's the last row)
        ELSE COALESCE(LEAD(student) OVER (ORDER BY id), student)
    END AS student
FROM Seat;