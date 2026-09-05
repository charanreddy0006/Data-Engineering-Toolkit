.PHONY: test build docker

test:
	python -m pytest -q

build:
	python -m compileall examples/python-etl/src

docker:
	docker build -t vehicle-etl:test examples/python-etl
