-- SQL Server to ADF to ADLS Migration
-- Incremental extraction using numeric watermark

DECLARE @LastWatermark BIGINT;

SELECT @LastWatermark = LastLoadValue
FROM dbo.WatermarkTable
WHERE TableName = 'DimCustomer'
  AND WatermarkColumn = 'CustomerKey';

SET @LastWatermark = ISNULL(@LastWatermark, 0);

SELECT *
FROM dbo.DimCustomer
WHERE CustomerKey > @LastWatermark;
