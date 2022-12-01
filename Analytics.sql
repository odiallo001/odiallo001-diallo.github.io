--


-- Get all restaurant data
SELECT [column1]
      ,[camis]
      ,[dba]
      ,[boro]
      ,[building]
      ,[street]
      ,[zipcode]
      ,[phone]
      ,[latitude]
      ,[longitude]
      ,[community_board]
      ,[council_district]
      ,[census_tract]
      ,[bin]
      ,[bbl]
      ,[nta]
      ,[cuisine_description]
  FROM [Fall_2022].[dbo].[restaurant_data];

-- Get all Violation data
SELECT [column1]
      ,[camis]
      ,[violation_code]
      ,[violation_description]
      ,[action]
      ,[score]
      ,[inspection_type]
      ,[grade]
      ,[grade_date]
      ,[inspection_date]
      ,[critical_flag]
      ,[record_date]
  FROM [Fall_2022].[dbo].[violation_data]

-- Count the number of restaurants by Grade
SELECT [grade],
    COUNT([column1]) AS Restaurants
FROM [Fall_2022].[dbo].[violation_data]
WHERE [grade] IS NOT NULL
GROUP BY [grade];

-- Count number of restaurants by score
SELECT [score],
    COUNT([column1]) AS Restaurants
FROM [Fall_2022].[dbo].[violation_data]
WHERE [score] IS NOT NULL
GROUP BY [score]
ORDER BY [score] ASC;

-- Count number of restaurants by Critical Flag
SELECT [critical_flag],
    COUNT([column1]) AS Restaurants
FROM [Fall_2022].[dbo].[violation_data]
GROUP BY [critical_flag];

-- Count number of restaurants by Violation Code
SELECT [violation_code],
    COUNT([column1]) AS Restaurants
FROM [Fall_2022].[dbo].[violation_data]
WHERE [violation_code] IS NOT NULL
GROUP BY [violation_code]
ORDER BY [violation_code] ASC;

-- Count number of restaurants by Location
SELECT [boro] AS Location
        ,COUNT([column1]) AS Restaurants
FROM [Fall_2022].[dbo].[restaurant_data]
GROUP BY [boro]
ORDER BY [boro] ASC;

-- Restaurants Graded 'A' and critical flag 'Not Critical'
SELECT [column1]
      ,[violation_code]
      ,[score]
      ,[grade]
      ,[critical_flag]
FROM [Fall_2022].[dbo].[violation_data]
  WHERE [grade] = 'A'
  AND [critical_flag] = 'Not Critical'
ORDER BY [column1] ASC;

-- Restaurants Graded 'A', 'Not Critical', Score greater than 15
SELECT [column1]
      ,[camis]
      ,[violation_code]
      ,[score]
      ,[grade]
      ,[critical_flag]
FROM [Fall_2022].[dbo].[violation_data]
  WHERE [grade] = 'A'
  AND [critical_flag] = 'Not Critical'
  AND [score] >= 15
ORDER BY [column1] ASC;

-- Restaurant location Graded 'A', 'Not Critical', Score greater than 15
SELECT [Fall_2022].[dbo].[restaurant_data].[dba] AS Restaurant
      ,[Fall_2022].[dbo].[restaurant_data].[boro] AS Location
      ,[Fall_2022].[dbo].[restaurant_data].[building]
      ,[Fall_2022].[dbo].[restaurant_data].[street]
      ,[Fall_2022].[dbo].[restaurant_data].[zipcode]
      ,[Fall_2022].[dbo].[restaurant_data].[phone]
      ,[Fall_2022].[dbo].[restaurant_data].[latitude]
      ,[Fall_2022].[dbo].[restaurant_data].[longitude]
      ,[Fall_2022].[dbo].[restaurant_data].[cuisine_description] AS Cuisine
      ,[Fall_2022].[dbo].[violation_data].[score]
      ,[Fall_2022].[dbo].[violation_data].[grade] AS Graded
  FROM [Fall_2022].[dbo].[restaurant_data]
  JOIN [Fall_2022].[dbo].[violation_data]
  ON ([Fall_2022].[dbo].[violation_data].[camis] = [Fall_2022].[dbo].[restaurant_data].[camis])
  WHERE [grade] = 'A'
  AND [critical_flag] = 'Not Critical'
  AND [score] >= 15
  ORDER BY [Fall_2022].[dbo].[restaurant_data].[dba] ASC;