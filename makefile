build: install ## Build the page.
	rm -rf dist
	npx parcel build source/html/index.html --public-url ./

develop: install ## Run development server.
	npx parcel source/html/index.html

serve: build ## Serve to test in a different device.
	python3 -m http.server 1234 --directory ./dist/

deploy: build ## Deploy on Github Pages.
	gh-pages -d dist

test: ## Run tests.
	elm-test

install: ## Only install dependencies.
	pnpm install



# The following makes this file self-documenting.
# See: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
