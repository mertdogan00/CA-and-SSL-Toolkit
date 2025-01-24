#!/bin/bash

# Generate private key for a specific domain
echo "🔑 Generating private key for domain.com..."
openssl genrsa -out ../examples/domain.com.key 2048

# Generate CSR for the domain
echo "📄 Generating CSR for domain.com..."
openssl req -new -key ../examples/domain.com.key -out ../examples/domain.com.csr \
  -subj "/C=XX/ST=State/L=City/O=Organization/OU=Department/CN=domain.com"

echo "🎉 CSR and private key for domain.com created successfully!"
