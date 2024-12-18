# Documentation management tasks
# Usage:
#   just init    - Install required tools
#   just build   - Build the documentation
#   just serve   - Serve the documentation locally

# Set the default recipe to print help
default:
  @just --list

init:
  #!/usr/bin/env sh
  command -v cargo >/dev/null 2>&1 || { echo "Error: cargo is required but not installed. Please install Rust toolchain first." >&2; exit 1; }
  echo "Installing/updating mdbook..."
  cargo install mdbook --version 0.4.37 || { echo "Error: Failed to install mdbook" >&2; exit 1; }
  echo "Installing/updating mdbook-admonish..."
  cargo install mdbook-admonish --version 1.15.0 || { echo "Error: Failed to install mdbook-admonish" >&2; exit 1; }
  echo "Setup completed successfully!"

serve:
  #!/usr/bin/env sh
  port="3000"
  echo "Starting documentation server on http://localhost:${port}"
  mdbook serve --port ${port} || { echo "Error: Failed to start server" >&2; exit 1; }  

build:
  #!/usr/bin/env sh
  echo "Building documentation..."
  mdbook build || { echo "Error: Build failed" >&2; exit 1; }
  echo "Build completed successfully!" 
