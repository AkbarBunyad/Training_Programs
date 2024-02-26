--Cleansed DIM_PRODUCTS Table
SELECT 
  p.[ProductKey], 
  p.[ProductAlternateKey] AS ProductItemCode --,[ProductSubcategoryKey]
  --,[WeightUnitMeasureCode]
  --,[SizeUnitMeasureCode]
  , 
  p.[EnglishProductName] AS [Product Name], 
  ps.EnglishProductSubCategoryName AS [Sub Category] --Joined in from Sub Category Table
  , 
  pc.EnglishProductCategoryName AS [Product Category] --Joined in from Category Table
  --,[SpanishProductName]
  --,[FrenchProductName]
  --,[StandardCost]
  --,[FinishedGoodsFlag]
  , 
  p.[Color] AS [Product Color] --,[SafetyStockLevel]
  --,[ReorderPoint]
  --,[ListPrice]
  , 
  p.[Size] AS [Product Size], 
  p.[ProductLine] AS [Product Line],
  p.[ModelName] AS [Product Model Name], 
  p.[EnglishDescription] AS [Product Description],
  ISNULL (p.Status, 'Outdated') AS [Product Status] 
FROM 
  [AdventureWorksDW2019].[dbo].[DimProduct] as p 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductSubcategory] AS ps on ps.ProductSubcategoryKey = p.ProductSubcategoryKey 
  LEFT JOIN [AdventureWorksDW2019].[dbo].[DimProductCategory] AS pc on ps.ProductCategoryKey = pc.ProductCategoryKey 
order by 
  p.ProductKey asc