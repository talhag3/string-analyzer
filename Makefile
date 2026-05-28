.PHONY: build test test-coverage shell

build:
	docker compose build

test:
	docker compose run --rm php vendor/bin/phpunit

test-coverage:
	docker compose run --rm php php -d xdebug.mode=coverage vendor/bin/phpunit --coverage-html coverage

shell:
	docker compose run --rm php bash