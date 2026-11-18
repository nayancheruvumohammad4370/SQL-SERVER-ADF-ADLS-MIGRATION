USE [master]
GO
/****** Object:  Database [SQL_ADF_Migration_Project]    Script Date: 18-11-2026 19:26:32 ******/
CREATE DATABASE [SQL_ADF_Migration_Project]
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET COMPATIBILITY_LEVEL = 170
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQL_ADF_Migration_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET ANSI_NULLS OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET ANSI_PADDING OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET ARITHABORT OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET AUTO_CLOSE ON
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET  ENABLE_BROKER
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET RECOVERY SIMPLE
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET  MULTI_USER
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET DB_CHAINING OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET DELAYED_DURABILITY = DISABLED
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET OPTIMIZED_LOCKING = OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SQL_ADF_Migration_Project]
GO
/****** Object:  User [adf_sql_login]    Script Date: 18-11-2026 19:26:33 ******/
CREATE USER [adf_sql_login] FOR LOGIN [adf_sql_login] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [adf_sql_login]
GO
/****** Object:  Table [dbo].[DimCategory]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCategory](
	[CategoryKey] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED
(
	[CategoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimCustomer]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimCustomer](
	[CustomerKey] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[IsCurrent] [bit] NULL,
PRIMARY KEY CLUSTERED
(
	[CustomerKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimDate]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimDate](
	[DateKey] [int] NOT NULL,
	[FullDate] [date] NULL,
	[Year] [int] NULL,
	[Quarter] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[DateKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimEmployee]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimEmployee](
	[EmployeeKey] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeID] [int] NULL,
	[EmployeeName] [varchar](100) NULL,
	[Role] [varchar](50) NULL,
	[StoreID] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[EmployeeKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPaymentMethod]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPaymentMethod](
	[PaymentMethodKey] [int] IDENTITY(1,1) NOT NULL,
	[PaymentMethodName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[PaymentMethodKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimProduct]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimProduct](
	[ProductKey] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NULL,
	[ProductName] [varchar](100) NULL,
	[Category] [varchar](50) NULL,
	[Price] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[ProductKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimPromotion]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimPromotion](
	[PromotionKey] [int] IDENTITY(1,1) NOT NULL,
	[PromotionName] [varchar](100) NULL,
	[DiscountPercent] [decimal](5, 2) NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
PRIMARY KEY CLUSTERED
(
	[PromotionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimRegion]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimRegion](
	[RegionKey] [int] IDENTITY(1,1) NOT NULL,
	[RegionName] [varchar](100) NULL,
	[Country] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[RegionKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimStore]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimStore](
	[StoreKey] [int] IDENTITY(1,1) NOT NULL,
	[StoreID] [int] NULL,
	[StoreName] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[StoreKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DimSupplier]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimSupplier](
	[SupplierKey] [int] IDENTITY(1,1) NOT NULL,
	[SupplierID] [int] NULL,
	[SupplierName] [varchar](100) NULL,
	[City] [varchar](50) NULL,
	[Country] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[SupplierKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCustomerActivity]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCustomerActivity](
	[ActivityKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[ActivityType] [varchar](50) NULL,
PRIMARY KEY CLUSTERED
(
	[ActivityKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactDiscounts]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactDiscounts](
	[DiscountKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[PromotionKey] [int] NULL,
	[ProductKey] [int] NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[DiscountKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactInventory]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactInventory](
	[InventoryKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[ProductKey] [int] NULL,
	[StoreKey] [int] NULL,
	[StockLevel] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[InventoryKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactOrders]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactOrders](
	[OrderKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[StoreKey] [int] NULL,
	[OrderAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[OrderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactPayments]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactPayments](
	[PaymentKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[PaymentMethodKey] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[PaymentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactProductPerformance]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactProductPerformance](
	[PerformanceKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[ProductKey] [int] NULL,
	[UnitsSold] [int] NULL,
	[Revenue] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[PerformanceKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactReturns]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactReturns](
	[ReturnKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[ProductKey] [int] NULL,
	[ReturnAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[ReturnKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactSales]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactSales](
	[SalesKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[CustomerKey] [int] NULL,
	[ProductKey] [int] NULL,
	[StoreKey] [int] NULL,
	[Quantity] [int] NULL,
	[SalesAmount] [decimal](10, 2) NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[SalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactShipment]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactShipment](
	[ShipmentKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[StoreKey] [int] NULL,
	[SupplierKey] [int] NULL,
	[ShipmentQuantity] [int] NULL,
PRIMARY KEY CLUSTERED
(
	[ShipmentKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactStoreSales]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactStoreSales](
	[StoreSalesKey] [bigint] IDENTITY(1,1) NOT NULL,
	[DateKey] [int] NULL,
	[StoreKey] [int] NULL,
	[TotalSales] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED
(
	[StoreSalesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WatermarkTable]    Script Date: 18-11-2026 19:26:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WatermarkTable](
	[TableName] [varchar](100) NOT NULL,
	[WatermarkColumn] [varchar](100) NULL,
	[LastLoadValue] [bigint] NULL,
PRIMARY KEY CLUSTERED
(
	[TableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[UpdateWatermark]    Script Date: 18-11-2026 19:26:33 ******/
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
USE [master]
GO
ALTER DATABASE [SQL_ADF_Migration_Project] SET  READ_WRITE
GO
