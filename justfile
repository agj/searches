port := "1237"

[private]
@default:
  just --list --unsorted

# Build the page.
build: install
  rm -rf dist
  pnpm exec vite build --base ./

# Run development server.
develop: install qr
  pnpm exec vite --port {{port}} --clearScreen false --host

# Deploy on Github Pages.
deploy: build
  pnpm exec gh-pages -d dist

# Run tests.
test:
  elm-test

# Only install dependencies.
install:
  pnpm install

[private]
qr:
    #!/usr/bin/env nu
    let ip = sys net | where name == "en0" | get ip | get 0 | where protocol == "ipv4" | get address | get 0
    let url = $"http://($ip):{{port}}"
    qrtool encode -t ansi256 $url
    print $url
