# Olist Ecommerce Analytics Pipeline

An end-to-end ELT pipeline built with **dbt**, **Snowflake**, and **GitHub**.

## Project Overview
This project transforms raw Brazilian E-commerce (Olist) data into a star schema optimized for BI tools like Power BI.

## Architecture
- **Staging Layer:** Initial cleaning and renaming of raw source data.
- **Marts Layer:** Business-ready fact and dimension tables (Star Schema).

## Tools Used
- **Snowflake:** Data Warehouse & Compute.
- **dbt (Data Build Tool):** Modeling and Transformation.
- **GitHub:** Version control and CI/CD.