UPDATE BlinkITGroceryData
SET Item_Fat_Content =
CASE WHEN Item_Fat_Content IN ('low fat','LF') THEN 'Low Fat'
WHEN Item_Fat_Content ='reg' THEN 'Regular'
ELSE Item_Fat_Content 
END ;
SELECT DISTINCT(Item_Fat_Content) FROM BlinkITGroceryData;
SELECT CAST(SUM(Total_Sales) AS INT)AS TOTAL_SALES from BlinkITGroceryData;
SELECT CAST(AVG(Total_Sales) AS DECIMAL(10,0)) AS AVG_SALES FROM BlinkITGroceryData;
SELECT COUNT(*)AS NO_OF_ITEMS  FROM BlinkITGroceryData;
SELECT CAST(SUM(Total_Sales)AS INT) FROM BlinkITGroceryData WHERE Item_Fat_Content='Low Fat';
SELECT CAST(SUM(Total_Sales)AS INT) FROM BlinkITGroceryData WHERE Outlet_Establishment_Year=2022;
SELECT CAST(AVG(Rating)AS DECIMAL(10,2))AS AVG_RATING FROM BlinkITGroceryData;
SELECT Item_Fat_Content ,CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
CAST(AVG(Total_Sales)AS DECIMAL(10,2)) AS AVG_SALES,
CAST(AVG(Rating) AS DECIMAL(10,2))AS AVG_RATING,
COUNT(*) AS NO_OF_ITEMS 
FROM BlinkITGroceryData 
GROUP BY Item_Fat_Content
ORDER BY Total_Sales DESC;
SELECT Item_Type ,CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS TOTAL_SALES,
CAST(AVG(Total_Sales)AS DECIMAL(10,2)) AS AVG_SALES,
CAST(AVG(Rating) AS DECIMAL(10,2))AS AVG_RATING,
COUNT(*) AS NO_OF_ITEMS 
FROM BlinkITGroceryData 
GROUP BY Item_Type
ORDER BY Total_Sales DESC
LIMIT 5;
SELECT Outlet_Location_Type,Item_Fat_Content ,CAST(SUM(Total_Sales) AS DECIMAL(10,2)) AS TOTAL_SALES
FROM BlinkITGroceryData 
GROUP BY Outlet_Location_Type,Item_Fat_Content
ORDER BY Total_Sales DESC;
SELECT Outlet_Establishment_Year,CAST(SUM(Total_Sales)AS DECIMAL(10,2)) as TOTAL_SALES FROM BlinkITGroceryData
GROUP BY Outlet_Establishment_Year
ORDER BY TOTAL_SALES DESC;
SELECT 
    Outlet_Size,
    CAST(SUM(Total_Sales) AS DECIMAL(10,1)) AS TOTAL_SALES,
    CAST(
        (SUM(Total_Sales) * 100.0 / 
         (SELECT SUM(Total_Sales) FROM BlinkITGroceryData)
        ) AS DECIMAL(10,1)
    ) AS SALES_PERCENTAGE
FROM BlinkITGroceryData
GROUP BY Outlet_Size
ORDER BY SALES_PERCENTAGE DESC;
SELECT Outlet_Location_Type,CAST(SUM(Total_Sales) AS DECIMAL(10,1)) AS TOTAL_SALES ,
CAST(AVG(Total_Sales)AS DECIMAL(10,2)) AS AVG_SALES,
CAST(AVG(Rating) AS DECIMAL(10,2))AS AVG_RATING,
CAST(SUM(Total_Sales)*100.0 /(SELECT SUM(Total_Sales) FROM BlinkITGroceryData) AS DECIMAL(10,2))AS SALES_PERCENTAGE,
COUNT(*) AS NO_OF_ITEMS 
FROM BlinkITGroceryData
GROUP BY Outlet_Location_Type
ORDER BY TOTAL_SALES DESC;
SELECT Outlet_Type,CAST(SUM(Total_Sales) AS DECIMAL(10,1)) AS TOTAL_SALES ,
CAST(AVG(Total_Sales)AS DECIMAL(10,2)) AS AVG_SALES,
CAST(AVG(Rating) AS DECIMAL(10,2))AS AVG_RATING,
CAST(SUM(Total_Sales)*100.0 /(SELECT SUM(Total_Sales) FROM BlinkITGroceryData) AS DECIMAL(10,2))AS SALES_PERCENTAGE,
COUNT(*) AS NO_OF_ITEMS 
FROM BlinkITGroceryData
GROUP BY Outlet_Type
ORDER BY TOTAL_SALES DESC;