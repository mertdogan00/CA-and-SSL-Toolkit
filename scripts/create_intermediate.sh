#!/bin/bash

# Generate Intermediate CA private key
echo "🔑 Generating Intermediate CA private key..."
openssl genrsa -out ../ca/intermediate.key 4096

# Create CSR (Certificate Signing Request) for Intermediate CA
echo "📄 Creating CSR for Intermediate CA..."
openssl req -new -key ../ca/intermediate.key -out ../ca/intermediate.csr \
  -subj "/C=US/ST=California/L=San Francisco/O=ExampleCorp/OU=Security/CN=Example Intermediate CA"

# Temporary file for CA:TRUE constraint
EXTFILE=$(mktemp)
echo "basicConstraints=CA:TRUE" > "$EXTFILE"

# Sign Intermediate CA with Root CA
echo "📄 Signing Intermediate CA with Root CA..."
openssl x509 -req -in ../ca/intermediate.csr -CA ../ca/rootCA.pem -CAkey ../ca/rootCA.key -CAcreateserial \
  -out ../ca/intermediate.pem -days 5475 -sha256 -extfile "$EXTFILE"

# Remove temporary file
rm -f "$EXTFILE"

echo "🎉 Intermediate CA has been successfully created!"
