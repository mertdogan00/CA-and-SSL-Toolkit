#!/bin/bash

# Certificate Verification Script
CERT_PATH="../crt/example.pem"             # Certificate to be verified
CA_CERT_PATH="../ca/ca_chain.pem"          # CA Chain (Intermediate + Root Certificates)

# Check if the certificate file exists
if [ ! -f "$CERT_PATH" ]; then
  echo "❌ Certificate file not found: $CERT_PATH"
  exit 1
fi

# Check if the CA chain file exists
if [ ! -f "$CA_CERT_PATH" ]; then
  echo "❌ CA Chain file not found: $CA_CERT_PATH"
  exit 1
fi

# Verify the certificate
echo "🔍 Verifying the certificate..."
openssl verify -CAfile "$CA_CERT_PATH" "$CERT_PATH"

# Verification result
if [ $? -eq 0 ]; then
  echo "🎉 Certificate successfully verified: $CERT_PATH"
else
  echo "❌ Certificate verification failed!"
  exit 1
fi
