
-- Now, Calculating "7-Day Moving Average" which tells whether performance is improving or degrading 
-- with time.
WITH Daily_Store_Performance AS (
    SELECT 
        DATE(o.Order_Timestamp) AS Order_Date,
        o.Store_ID,
        ROUND(AVG(TIMESTAMPDIFF(MINUTE, o.Order_Timestamp, d.Delivered_Timestamp)), 2) AS Daily_Avg_Delivery_Time
    FROM Orders o
    JOIN Deliveries d ON o.Order_ID = d.Order_ID
    WHERE o.Order_Status = 'Delivered'
    GROUP BY DATE(o.Order_Timestamp), o.Store_ID
)
SELECT 
    Order_Date,
    Store_ID,
    Daily_Avg_Delivery_Time,
    -- Window Function to calculate 7-Day Rolling Average
    ROUND(AVG(Daily_Avg_Delivery_Time) OVER(
        PARTITION BY Store_ID 
        ORDER BY Order_Date 
        ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
    ), 2) AS 7_Day_Moving_Avg
FROM Daily_Store_Performance
ORDER BY Store_ID, Order_Date;