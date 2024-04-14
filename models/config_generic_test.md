# Model definition
models:
  - name: my_model
    tests:
      - dbt_utils.unique_combination_of_columns:  # Call the macro
          combination_of_columns:  # Specify the columns to check
            - order_id
            - product_id
 