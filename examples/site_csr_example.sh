#!/bin/bash

# Generate private key for the site
echo "🔑 Generating private key for mysite.com..."
openssl genrsa -out ../examples/mysite.com.key 2048

# Generate CSR for the site
echo "📄 Generating CSR for mysite.com..."
openssl req -new -key ../examples/mysite.com.key -out ../examples/mysite.com.csr \
  -subj "/C=XX/ST=State/L=City/O=Organization/OU=Department/CN=mysite.com"

echo "🎉 CSR and private key for mysite.com created successfully!"
