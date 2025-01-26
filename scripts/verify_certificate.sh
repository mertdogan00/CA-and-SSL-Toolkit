#!/bin/bash

# CSR Signing Script for Certificates
CSR_PATH="../crt/example.csr"               # Path to the CSR file to be signed
OUTPUT_CERT="../crt/example.pem"           # Path to the output certificate
INTERMEDIATE_CA="../ca/intermediateCA.pem" # Intermediate Certificate (CA)
INTERMEDIATE_KEY="../ca/intermediateCA.key" # Private key of the Intermediate CA

# Check if the CSR file exists
if [ ! -f "$CSR_PATH" ]; then
  echo "❌ CSR file not found: $CSR_PATH"
  exit 1
fi

# Check if the Intermediate CA certificate and private key exist
if [ ! -f "$INTERMEDIATE_CA" ] || [ ! -f "$INTERMEDIATE_KEY" ]; then
  echo "❌ Missing Intermediate CA certificate or private key!"
  exit 1
fi

# Sign the CSR with the Intermediate CA
echo "📄 Signing the CSR with the Intermediate Certificate Authority..."
openssl x509 -req -in "$CSR_PATH" -CA "$INTERMEDIATE_CA" -CAkey "$INTERMEDIATE_KEY" -CAcreateserial \
  -out "$OUTPUT_CERT" -days 365 -sha256

# Output the result
if [ -f "$OUTPUT_CERT" ]; then
  echo "🎉 Certificate successfully created: $OUTPUT_CERT"
else
  echo "❌ Certificate creation failed!"
  exit 1
fi
