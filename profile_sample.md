dev_sso:
  # Update these values:
  user: "{{ env_var('USERNAME') }}"
  role: "SNF_FR_PRACTICEHUB_DEV"
  database: "APP_PRACTICEHUB_DB"
  warehouse: "PRACTICEHUB_LOAD_WH"
  schema: "PRACTICEHUB_CONFORMED"
  query_tag: "{{ env_var('USERNAME') }}-dbt-project-practicehub"
  # Keep these values:
  type: "snowflake"
  account: "lplfinancial-enterprise-data-dev"
  authenticator: "externalbrowser"
  client_session_keep_alive: False
  reuse_connections: True
  threads: 1

sandbox_pk:
  user: "PRACTICEHUB_SERVICE_ACCOUNT"
  private_key_path: "rsa_key.p8"
  role: "SNF_FR_PRACTICEHUB_DEV"
  database: "APP_PRACTICEHUB_DB"
  warehouse: "PRACTICEHUB_LOAD_WH"
  schema: "PRACTICEHUB_CONFORMED"
  query_tag: "sa-dbt-project-template"
  private_key_passphrase: "{{ env_var('PRIVATE_KEY_PASSPHRASE') }}"
  type: "snowflake"
  account: "lplfinancial-sandbox"
  client_session_keep_alive: False
  reuse_connections: True
  threads: 1



smauto:
  outputs:
    dev:
      account: wn13715.ap-southeast-1
      password: Sunil@1995
      role: ACCOUNTADMIN
      database: DEMO
      schema: DATA_SCHEMA
      threads: 1
      type: snowflake
      user: sdfdsfsfsdaf
      warehouse: COMPUTE_WH
  target: dev





my_profile:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: dev-account-url.snowflakecomputing.com
      user: dev-username
      password: dev-password
      database: dev-database
      warehouse: dev-warehouse
      schema: dev-schema

#question is where we srore the dbt_user and password?????????????????????????????????



      host: 127.0.0.1
      user: "{{ env_var('DBT_USER') }}"  # Access username from environment variable
      password: "{{ env_var('DBT_PASSWORD') }}"  # Access password from environment variable


    prod:
      type: snowflake
      account: prod-account-url.snowflakecomputing.com
      user: prod-username
      password: prod-password
      database: prod-database
      warehouse: prod-warehouse
      schema: prod-schema

    qa:
      type: snowflake
      account: qa-account-url.snowflakecomputing.com
      user: qa-username
      password: qa-password
      database: qa-database
      warehouse: qa-warehouse
      schema: qa-schema
