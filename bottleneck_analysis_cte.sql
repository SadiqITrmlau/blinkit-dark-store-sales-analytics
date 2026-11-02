-- Micro Intervals & SLA Breaches (CTEs)
-- With this query we are tracking time(in mins) taken at every step & exposing peak hour anomaly (7PM-9PM)
WITH Delivery_Micro_Intervals AS (
    SELECT 
        o.Store_ID,
        o.Order_ID,
        HOUR(o.Order_Timestamp) AS Hour_of_Day,
        -- Calculating time taken at each stage using TIMESTAMPDIFF
        TIMESTAMPDIFF(MINUTE, o.Order_Timestamp, d.Picked_Timestamp) AS Pick_Delay_Min,
        TIMESTAMPDIFF(MINUTE, d.Picked_Timestamp, d.Dispatched_Timestamp) AS Pack_Delay_Min,
        TIMESTAMPDIFF(MINUTE, d.Dispatched_Timestamp, d.Delivered_Timestamp) AS Transit_Time_Min,
        TIMESTAMPDIFF(MINUTE, o.Order_Timestamp, d.Delivered_Timestamp) AS Total_Delivery_Min
    FROM Orders o
    JOIN Deliveries d ON o.Order_ID = d.Order_ID
    WHERE o.Order_Status = 'Delivered'
)
SELECT 
    Store_ID,
    Hour_of_Day,
    COUNT(Order_ID) AS Total_Orders,
    ROUND(AVG(Pick_Delay_Min), 2) AS Avg_Pick_Time,
    ROUND(AVG(Transit_Time_Min), 2) AS Avg_Transit_Time,
    ROUND(AVG(Total_Delivery_Min), 2) AS Avg_Total_Time,
    SUM(CASE WHEN Total_Delivery_Min > 10 THEN 1 ELSE 0 END) AS SLA_Breaches,
    ROUND((SUM(CASE WHEN Total_Delivery_Min > 10 THEN 1 ELSE 0 END) / COUNT(Order_ID)) * 100, 2) AS Breach_Percentage
FROM Delivery_Micro_Intervals
GROUP BY Store_ID, Hour_of_Day
ORDER BY Hour_of_Day, Breach_Percentage DESC;

-- Here we can see breach percentage is highest from 7PM to 9PM because of High Average Pick Time 
-- This is the Root cause Analysis