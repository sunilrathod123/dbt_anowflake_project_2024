we can gererate the code using the code gen package

use the code in the analysis beacuse when we run the model the analysis folder not run 
 ##  dbt compile -s code_gen

 version: 2

sources:
  - name: public
    tables:
      - name: check_number
      - name: country
      - name: customer_new
