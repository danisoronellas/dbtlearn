include .env
export

.PHONY: dbt-run dbt-test

dbt-run:
	dbt run --profiles-dir ./

dbt-test:
	dbt test --profiles-dir ./


