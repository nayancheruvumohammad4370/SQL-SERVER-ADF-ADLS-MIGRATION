# SQL Server to Azure Data Factory to ADLS Gen2 Migration

## 1. Project Overview

This project demonstrates data migration from an on-premises SQL Server database to Azure Data Lake Storage Gen2 using Azure Data Factory.

It includes full data loading, incremental loading using watermark logic, and storage of extracted data in Parquet format.

## 2. Architecture

SQL Server Express (Source)
        |
        v
Azure Data Factory
        |
        v
Self-Hosted Integration Runtime
        |
        v
ADLS Gen2 - Bronze Layer
        |
        v
Parquet Files

## 3. Technologies Used

- Microsoft SQL Server Express
- Azure Data Factory (ADF)
- Azure Data Lake Storage Gen2
- Self-Hosted Integration Runtime
- PowerShell
- Git and GitHub
- Parquet

## 4. Source Database

Database: SQL_ADF_Migration_Project

The database contains 20 tables:
- 10 Dimension tables
- 10 Fact tables

## 5. Implemented Pipelines

### PL_SQL_TO_ADLS_DIMCUSTOMER
- Reads DimCustomer from SQL Server.
- Uses ADF Copy Activity.
- Writes data in Parquet format to ADLS Gen2.
- Successfully migrated 10,000 records.

### PL_INCREMENTAL_DIMCUSTOMER
- Uses watermark-based incremental extraction.
- Reads the last loaded CustomerKey from WatermarkTable.
- Extracts records with CustomerKey greater than the stored watermark.
- Supports incremental loading of new records.

## 6. Watermark Management

SQL Server table: dbo.WatermarkTable

Stored procedure: dbo.UpdateWatermark

The watermark tracks the last successfully processed key for incremental extraction.

Example:
CustomerKey > LastLoadValue

## 7. Storage Structure

ADLS Gen2:
- Container: bronze
- Dataset: DimCustomer
- Format: Parquet

## 8. Integration Runtime

A Self-Hosted Integration Runtime is configured to connect Azure Data Factory with the local SQL Server environment.

## 9. Future Enhancements

- Parent and child pipeline orchestration.
- Metadata-driven ingestion for multiple tables.
- Complete Bronze, Silver and Gold medallion architecture.
- Azure Databricks and PySpark transformations.
- Data quality checks and monitoring.
- CI/CD deployment through Azure DevOps.

## 10. Project Status

Initial full-load and incremental-load implementations for DimCustomer have been completed and tested successfully.

Further enhancements are planned.
