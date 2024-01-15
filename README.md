# Analytics Engineering Challenge README

## Project Overview

Welcome to my Analytics Engineering Challenge project! This project showcases my expertise in architecting a robust and scalable data warehouse using dbt Cloud. The architecture is designed with a three-layer approach to ensure the data is efficiently processed, transformed, and made accessible for various analytics needs.

### Project Structure

1. **Staging Layer:**
   - Purpose: In this layer, data is ingested from various sources into the connected data warehouse in BigQuery.
   - Operations:
     - Basic Cleaning: Initial cleaning to handle missing values, outliers, and other data quality issues.
     - Deduplication: Ensuring data integrity by eliminating duplicate records.

2. **Curated Base Layer:**
   - Purpose: This layer prepares the data according to specific contexts, making it a reliable dataset for deployment in various data products such as reports, pipelines, and metric calculations.
   - Operations:
     - Joins: Combining data from different sources to enrich the dataset.
     - Conditionals: Applying conditional logic to filter and categorize data.
     - Date Transformations: Standardizing date formats and extracting relevant date information.
     - Data Type Formatting: Ensuring consistency in data types for downstream processes.
     - Other Transformations: Custom transformations as needed for the specific context.

3. **Mart Layer:**
   - Purpose: The final layer exposed to end consumers, whether it be visualization tools, stakeholders, or other pipelines. This layer includes business definitions, refined data type formatting, final calculations, and deployment of requirements for the end product.
   - Operations:
     - Business Definitions: Applying business rules and logic to define key metrics and KPIs.
     - Data Type Refinement: Ensuring the data types are aligned with the requirements of the end product.
     - Final Calculations: Performing any last-mile calculations needed for the end-user.
     - Deployment of Requirements: Preparing the data for seamless integration into the desired end products.

## Getting Started

To get started with this Analytics Engineering Challenge project, follow the steps below:

1. **Clone the Repository:**
   ```
   git clone https://github.com/soaresvml/pleo_ae_challenge24.git
   ```

2. **Set Up dbt Cloud:**
   - Create an account on dbt Cloud if not already done.
   - Connect the project to your dbt Cloud workspace.

3. **Run the dbt Jobs:**
   - Execute the dbt jobs for each layer in the following order: Staging -> Curated Base -> Mart.
   ```
   dbt run --models staging
   dbt run --models curated_base
   dbt run --models mart
   ```

4. **Review the Results:**
   - Explore the outputs generated in dbt Cloud to ensure each layer performs as expected.

## Project Dependencies

- [dbt Cloud](https://cloud.getdbt.com/): Used for executing the dbt jobs and managing the analytics engineering workflow.

## Contact

If you have any questions or need further assistance, feel free to reach out:

- Vinicius Soares
- LinkedIn: [Vinicius Soares](https://www.linkedin.com/in/soaresvml/)

🚀
