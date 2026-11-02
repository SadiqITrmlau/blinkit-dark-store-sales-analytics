
-- Quality & Financial Loss - Calculating Order Defect Rate (ODR)  
-- Defects in Blinkit Operations can lead to heavy financial loss.
-- Writing Query to calculate store-wise defect rates and total refund loss.

SELECT 
    o.Store_ID,
    COUNT(DISTINCT o.Order_ID) AS Total_Delivered_Orders,
    COUNT(DISTINCT od.Defect_ID) AS Total_Defects,
    ROUND((COUNT(DISTINCT od.Defect_ID) / COUNT(DISTINCT o.Order_ID)) * 100, 2) AS ODR_Percentage,
    SUM(od.Refund_Amount) AS Total_Refund_Loss,
    -- Finding the most common defect reason per store
    (SELECT Defect_Type 
     FROM Order_Defects od2 
     JOIN Orders o2 ON od2.Order_ID = o2.Order_ID 
     WHERE o2.Store_ID = o.Store_ID 
     GROUP BY Defect_Type 
     ORDER BY COUNT(Defect_Type) DESC LIMIT 1) AS Most_Common_Defect
FROM Orders o
LEFT JOIN Order_Defects od ON o.Order_ID = od.Order_ID
WHERE o.Order_Status = 'Delivered'
GROUP BY o.Store_ID
ORDER BY ODR_Percentage DESC;  
