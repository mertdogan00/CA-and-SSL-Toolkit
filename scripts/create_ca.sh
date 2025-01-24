#!/bin/bash

# Generate Root CA private key
echo "🔑 Generating Root CA private key..."
openssl genrsa -out ../ca/rootCA.key 4096

# Create Root CA certificate
echo "📄 Creating Root CA certificate..."
openssl req -x509 -new -nodes -key ../ca/rootCA.key -sha256 -days 5475 -out ../ca/rootCA.pem \
  -subj "/C=XX/ST=State/L=City/O=Organization/OU=Department/CN=RootCA"

# Generate Intermediate CA private key
echo "🔑 Generating Intermediate CA private key..."
openssl genrsa -out ../ca/intermediateCA.key 4096

# Create Intermediate CA CSR
echo "📄 Creating Intermediate CA CSR..."
openssl req -new -key ../ca/intermediateCA.key -out ../ca/intermediateCA.csr \
  -subj "/C=XX/ST=State/L=City/O=Organization/OU=Department/CN=IntermediateCA"

# Sign Intermediate CA with Root CA
echo "📄 Signing Intermediate CA with Root CA..."
openssl x509 -req -in ../ca/intermediateCA.csr -CA ../ca/rootCA.pem -CAkey ../ca/rootCA.key -CAcreateserial \
  -out ../ca/intermediateCA.pem -days 5475 -sha256

echo "🎉 Root and Intermediate CA created successfully!"
