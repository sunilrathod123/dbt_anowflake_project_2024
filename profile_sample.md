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
