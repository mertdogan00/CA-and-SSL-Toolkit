#!/bin/bash

# Generate private key for a self-signed certificate
echo "🔑 Generating private key for self-signed certificate..."
openssl genrsa -out ../examples/selfsigned.key 2048

# Create a self-signed certificate
echo "📄 Creating self-signed certificate..."
openssl req -x509 -new -nodes -key ../examples/selfsigned.key -sha256 -days 365 \
  -out ../examples/selfsigned.crt \
  -subj "/C=XX/ST=State/L=City/O=Organization/OU=Department/CN=selfsigned.example.com"

echo "🎉 Self-signed certificate created successfully!"
