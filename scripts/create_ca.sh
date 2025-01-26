#!/bin/bash

# Script for creating Root and Intermediate CA
# General-purpose example for global use

# Generate the Root CA private key
echo "🔑 Generating Root CA private key..."
openssl genrsa -out rootCA.key 4096

# Create the Root CA certificate
echo "📄 Creating Root CA certificate..."
openssl req -x509 -new -nodes -key rootCA.key -sha256 -days 5475 -out rootCA.pem \
  -subj "/C=US/ST=State/L=City/O=Organization/OU=RootCA/CN=Root CA"

# Generate the Intermediate CA private key
echo "🔑 Generating Intermediate CA private key..."
openssl genrsa -out intermediateCA.key 4096

# Create the CSR (Certificate Signing Request) for the Intermediate CA
echo "📄 Creating CSR for Intermediate CA..."
openssl req -new -key intermediateCA.key -out intermediateCA.csr \
  -subj "/C=US/ST=State/L=City/O=Organization/OU=IntermediateCA/CN=Intermediate CA"

# Create a temporary file for CA:TRUE configuration
EXTFILE=$(mktemp)
echo "basicConstraints=CA:TRUE" > "$EXTFILE"

# Sign the Intermediate CA with the Root CA
echo "📄 Signing Intermediate CA with Root CA..."
openssl x509 -req -in intermediateCA.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial \
  -out intermediateCA.pem -days 5475 -sha256 -extfile "$EXTFILE"

# Remove the temporary file
rm -f "$EXTFILE"

echo "🎉 Root and Intermediate CA have been successfully created!"
