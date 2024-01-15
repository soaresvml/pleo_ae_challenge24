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

## Suggested Tests for MRR Model Quality Assurance:

### Tests 
#### Curated Base Layer (pleo_dw2_billing__mrr_invoice_items):

1. **Not Null Test on Invoice Item ID:**
   - *Motivation:* Ensures that the primary key, `id`, for each invoice item is not null, maintaining data integrity and completeness.

2. **Unique Test on Invoice Item ID:**
   - *Motivation:* Guarantees the uniqueness of each `id` in the curated base layer, preventing any potential duplication issues and supporting accurate record identification.

3. **Not Null Test on Invoice ID:**
   - *Motivation:* Validates that the `invoice_id` is not null, ensuring the foreign key relationship is intact and facilitating accurate joins with other relevant tables.

#### Mart Layer (pleo_dw3_billing__mrr_customer_per_day):

1. **Not Null Test on Invoice ID:**
   - *Motivation:* Ensures that the `invoice_id` is not null, supporting data completeness and integrity in the mart layer for customer per day metrics.

2. **Not Null Test on Amount Per Day:**
   - *Motivation:* Validates that the `amount_per_day` is not null, maintaining the quality of the calculated metrics and preventing downstream issues related to missing data.

3. **Unique Combination Test on Report Date, Customer ID, and Invoice ID:**
   - *Motivation:* Verifies the uniqueness of combinations of `report_date`, `customer_id`, and `invoice_id` in the mart layer, ensuring that each record is uniquely identified for accurate reporting and analysis.

### Overall Rationale:

- **Data Integrity:** The "not_null" tests ensure that essential fields are populated, maintaining data integrity throughout the curated base and mart layers.

- **Uniqueness Assurance:** The "unique" and "unique_combination_of_columns" tests guarantee the uniqueness of key identifiers, preventing potential issues related to duplicate records and supporting reliable analytics.

- **Foreign Key Validations:** The "not_null" test on `invoice_id` in both layers ensures the foreign key relationships are maintained, facilitating seamless joins and relationships with other tables.

Implementing these tests enhances the overall quality and reliability of the MRR model, providing a solid foundation for downstream analytics and reporting processes.


## Contact

If you have any questions or need further assistance, feel free to reach out:

- Vinicius Soares
- LinkedIn: [Vinicius Soares](https://www.linkedin.com/in/soaresvml/)

🚀
