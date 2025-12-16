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

[private]
install:
  pnpm install

[private]
qr:
    #!/usr/bin/env nu
    let ip = sys net | where name == "en0" | get 0.ip | where protocol == "ipv4" | get 0.address
    let url = $"http://($ip):{{port}}"
    qrtool encode -t ansi256 $url
    print $url
