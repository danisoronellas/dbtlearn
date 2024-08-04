include .env
export

.PHONY: run test

dbt-run:
	dbt run --profiles-dir ./

dbt-test:
	dbt test --profiles-dir ./


