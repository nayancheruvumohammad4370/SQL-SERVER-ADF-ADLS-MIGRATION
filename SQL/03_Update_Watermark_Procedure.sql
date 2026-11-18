USE [SQL_ADF_Migration_Project]
GO

/****** Object:  StoredProcedure [dbo].[UpdateWatermark]    Script Date: 18-11-2026 19:34:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE   PROCEDURE [dbo].[UpdateWatermark]
    @TableSchema VARCHAR(50),
    @TableName VARCHAR(100),
    @WatermarkColumn VARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @SQL NVARCHAR(MAX);
    DECLARE @MaxValue BIGINT;

    SET @SQL =
        'SELECT @MaxVal = MAX(' + QUOTENAME(@WatermarkColumn) + ')
         FROM ' + QUOTENAME(@TableSchema) + '.' + QUOTENAME(@TableName);

    EXEC sp_executesql
        @SQL,
        N'@MaxVal BIGINT OUTPUT',
        @MaxVal = @MaxValue OUTPUT;

    SET @MaxValue = ISNULL(@MaxValue, 0);

    UPDATE dbo.WatermarkTable
    SET LastLoadValue = @MaxValue
    WHERE TableName = @TableName
      AND WatermarkColumn = @WatermarkColumn;

    IF @@ROWCOUNT = 0
    BEGIN
        INSERT INTO dbo.WatermarkTable
        (TableName, WatermarkColumn, LastLoadValue)
        VALUES
        (@TableName, @WatermarkColumn, @MaxValue);
    END
END;
GO
