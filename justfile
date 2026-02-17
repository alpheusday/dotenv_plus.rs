set shell := ["bash", "-cu"]
set windows-shell := ["pwsh", "-Command"]

# Default action
_:
    just lint
    just fmt
    just test

# Lint code
lint:
    ls-lint -config ./.ls-lint.yaml
    typos
    cargo check
    cargo clippy
    cargo test -p dotenv_plus -- --nocapture

# Format code
fmt:
    cargo fmt

# Run test
test:
    cargo test -p tests -- --nocapture

# Publish package as dry-run
publish-try:
    cd ./package && cargo publish --dry-run

# Publish package
publish:
    cd ./package && cargo publish

# Clean up
clean:
    cargo clean
