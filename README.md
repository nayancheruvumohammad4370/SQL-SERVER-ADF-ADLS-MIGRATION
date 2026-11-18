# SQL Server → Azure Data Factory → ADLS Gen2 Migration

## Project Overview

A hands-on data migration project demonstrating how data is extracted from a local SQL Server source and landed in Azure Data Lake Storage Gen2 using Azure Data Factory.

## Technology Stack

- SQL Server Express 2025
- Azure Data Factory
- Azure Data Lake Storage Gen2
- Self-hosted Integration Runtime
- SQL stored procedures
- Parquet

## Architecture

SQL Server → Self-hosted Integration Runtime → Azure Data Factory → ADLS Gen2 (Bronze)

## Source Database

- Database: `SQL_ADF_Migration_Project`
- Source schema: 10 dimension tables and 10 fact tables
- The database contains 20 source tables; the full migration of all tables is not yet claimed as complete.

## Implemented and Tested

- Configured connectivity from Azure Data Factory to local SQL Server using Self-hosted Integration Runtime.
- Completed a full load of **10,000 DimCustomer records**.
- Stored the output as Parquet in the ADLS Gen2 Bronze container.
- Implemented watermark tracking and SQL stored-procedure integration for incremental loading.

## Azure Resources

- Data Factory: `adf-sql-migration`
- Storage account: `migrationfromsqltoadls`
- Container: `bronze`

## Next Steps

- Extend the pattern to additional dimension and fact tables.
- Build parent-child orchestration and metadata-driven ingestion.
- Add Silver and Gold transformations with Azure Databricks and PySpark.
- Add CI/CD using Azure DevOps.

*Project status: core DimCustomer full and incremental load demonstrated; multi-table expansion and downstream transformations remain future enhancements.*
