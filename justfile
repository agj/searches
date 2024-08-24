[private]
default:
	just --list

# Build the page.
build: install
	rm -rf dist
	npx parcel build source/html/index.html --public-url ./

# Run development server.
develop: install
	npx parcel --port 1237 source/html/index.html

# Serve to test in a different device.
serve: build
	python3 -m http.server 1237 --directory ./dist/

# Deploy on Github Pages.
deploy: build
	npx gh-pages -d dist

# Run tests.
test:
	elm-test

# Only install dependencies.
install:
	pnpm install
