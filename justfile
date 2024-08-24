[private]
default:
	just --list

# Build the page.
build: install
	rm -rf dist
	pnpm exec parcel build source/html/index.html --public-url ./ --no-autoinstall

# Run development server.
develop: install
	pnpm exec parcel --port 1237 source/html/index.html --no-autoinstall

# Serve to test in a different device.
serve: build
	python3 -m http.server 1237 --directory ./dist/

# Deploy on Github Pages.
deploy: build
	pnpm exec gh-pages -d dist

# Run tests.
test:
	elm-test

# Only install dependencies.
install:
	pnpm install
