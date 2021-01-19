
NPX=$(shell which npx)
YARN=$(shell which yarn)

.PHONY: dev build start generate test test/unit test/e2e

dev:
	$(NPX) nuxt-ts

build:
	$(NPX) nuxt-ts build

start: generate
	$(NPX) nuxt-ts start

generate:
	$(NPX) nuxt-ts generate --fail-on-error

test:
	$(YARN) test:unit && $(YARN) test:e2e

test/unit:
	$(NPX) cross-env TEST=unit ava './test/specs/**/*'

test/e2e:
	$(NPX) cross-env TEST=e2e ava './test/e2e/**/*'




