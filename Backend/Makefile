include .env
export

PYTHONPATH=$(CURDIR)/src


.PHONY: install
install:
	poetry install

.PHONY: lock
lock:
	poetry lock --no-update

.PHONY: start
start:
	python src/main.py

.PHONY: migrate
migrate:
	alembic upgrade head

.PHONY: migrations
migrations:
	alembic revision --autogenerate -m "new"

.PHONY: lint
lint:
	python -m ruff src

.PHONY: fmt
fmt:
	python -m ruff format src && python -m ruff check src --fix

.PHONY: mypy
mypy:
	python -m mypy src

.PHONY: safety
safety:
	python -m safety check

.PHONY: test
test:
	export DB_NAME="test_euroget"; python -m pytest src $(opts)

.PHONY: coverage
coverage:
	pytest --cov-report term-missing --cov-report html --cov=src


.PHONY: docker-up
docker-up:
	docker-compose up -d

.PHONY: docker-down
docker-down:
	docker-compose down --remove-orphans

.PHONY: psql
psql:
	docker-compose exec -it database psql -U $$DB_USER -d $$DB_NAME

.PHONY: drop-all
drop-all:
	docker-compose exec -it database psql -U $$DB_USER -d $$DB_NAME -c "DROP SCHEMA public CASCADE; CREATE SCHEMA public;"



.PHONY: deploy-prod
deploy-prod:
	railway up --environment production --service euroget_backend