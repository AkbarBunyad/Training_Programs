--Cleansed DIM_Customers Table --
SELECT 
  c.customerkey AS CustomerKey, 
  --[GeographyKey]
  --,[CustomerAlternateKey]
  --,[Title]
  c.firstname AS [First Name], 
  --,[MiddleName],
  c.lastname AS [Last Name],
  c.firstname + ' ' + lastname AS [Full Name], 
  -- Combined First and Last Name
  --,[NameStyle]
  --,[BirthDate]
  --,[MaritalStatus]
  --,[Suffix]
  CASE c.gender WHEN 'M' THEN 'MALE' WHEN 'F' THEN 'Female' END AS Gender, 
  --,[EmailAddress]
  --,[YearlyIncome]
  --,[TotalChildren]
  --,[NumberChildrenAtHome]
  --,[EnglishEducation]
  --,[SpanishEducation]
  --,[FrenchEducation]
  --,[EnglishOccupation]
  --,[SpanishOccupation]
  --,[FrenchOccupation]
  --,[HouseOwnerFlag]
  --,[NumberCarsOwned]
  --,[AddressLine1]
  --,[AddressLine2]
  --,[Phone]
  c.datefirstpurchase AS DateFirstPurchase, 
  --,[CommuteDistance]
  g.city AS [Customer City] --Joined in Customer City From Geography Table
FROM 
  [AdventureWorksDW2019].[dbo].[DimCustomer] AS c 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimGeography] AS g ON g.geographykey = c.geographykey 
ORDER BY 
  CustomerKey ASC --Ordered LIST by CustomerKey
