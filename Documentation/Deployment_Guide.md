# Deployment and Execution Guide

## 1. Prerequisites

- Azure subscription
- Azure Data Factory
- Azure Data Lake Storage Gen2 account
- Local SQL Server instance
- Self-Hosted Integration Runtime
- Git

## 2. SQL Server Setup

1. Install SQL Server.
2. Create database SQL_ADF_Migration_Project.
3. Execute SQL scripts in the SQL folder in the appropriate order:
   - 01_Database_Schema.sql
   - 02_Watermark_Table.sql
   - 03_Update_Watermark_Procedure.sql
4. Configure the initial watermark value.
5. Verify source table records.

## 3. Azure Resources

Configure:
- Azure Data Factory
- ADLS Gen2 storage account
- Bronze container
- Self-Hosted Integration Runtime

## 4. Linked Services

Create the following linked services:

- LS_SQLSERVER_ONPREM
- LS_ADLS_MIGRATION

Provide your own server, database, authentication and storage credentials securely.

Do not commit credentials, account keys or passwords to GitHub.

## 5. Datasets

Configure:
- DS_SQLSERVER_SOURCE
- DS_ADLS_PARQUET_SINK

Verify source and sink connections.

## 6. Pipeline Execution

### Full Load

Execute PL_SQL_TO_ADLS_DIMCUSTOMER.

Expected result:
- 10,000 source records copied.
- Parquet output created in ADLS Gen2 Bronze.

### Incremental Load

Execute PL_INCREMENTAL_DIMCUSTOMER.

Expected logic:
- Read the previous watermark.
- Extract records with CustomerKey greater than the watermark.
- Write incremental records to ADLS Gen2.
- Update watermark after successful processing.

## 7. Validation

Verify:
- Source SQL record count.
- ADF pipeline execution status.
- ADLS output files.
- Parquet record count.
- WatermarkTable values.

## 8. Security

- Never upload credentials or account keys.
- Use secure authentication.
- Protect deployment parameter files.
- Configure appropriate Azure RBAC permissions.

## 9. Repository Structure

- SQL: Database and watermark scripts.
- ADF/Pipelines: Pipeline definitions.
- ADF/Datasets: Dataset definitions.
- ADF/LinkedServices: Connection definitions.
- ADF/ARM-Templates: Deployment templates.
- Documentation: Project documentation.
- Screenshots: Implementation evidence.
