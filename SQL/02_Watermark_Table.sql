USE [SQL_ADF_Migration_Project]
GO

/****** Object:  Table [dbo].[WatermarkTable]    Script Date: 18-11-2026 19:29:48 ******/
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
