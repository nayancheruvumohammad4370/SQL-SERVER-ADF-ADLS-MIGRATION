# SQL Server to Azure Data Factory to ADLS Gen2 Migration

## Project Overview
Data migration from SQL Server to Azure Data Lake Storage Gen2 using Azure Data Factory.

## Technology Stack
- SQL Server Express 2025
- Azure Data Factory
- Azure Data Lake Storage Gen2
- Self-Hosted Integration Runtime
- SQL Stored Procedures
- Parquet

## Architecture
SQL Server ? Azure Data Factory ? ADLS Gen2 (Bronze)

## Database
SQL_ADF_Migration_Project

20 tables:
- 10 Dimension tables
- 10 Fact tables

## Implemented
The following pipelines have been implemented and tested for DimCustomer:

- SQL Server connectivity
- Self-Hosted Integration Runtime
- Full data load (10,000 records)
- Incremental data load using CustomerKey watermark
- Watermark management using SQL stored procedure
- Parquet output in ADLS Gen2 Bronze

## Azure Resources
- Data Factory: adf-sql-migration
- Storage Account: migrationfromsqltoadls
- Container: bronze

## Future Enhancements
- Metadata-driven pipelines for multiple tables
- Parent-child orchestration
- Complete Bronze, Silver and Gold architecture
- Azure Databricks and PySpark transformations
- CI/CD using Azure DevOps
