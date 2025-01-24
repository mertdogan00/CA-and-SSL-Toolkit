#!/bin/bash

CERT_PATH="../ca/domain.crt"
CA_CERT_PATH="../ca/intermediateCA.pem"

if [ ! -f "$CERT_PATH" ]; then
  echo "❌ Certificate file not found!"
  exit 1
fi

echo "🔍 Verifying certificate..."
openssl verify -CAfile "$CA_CERT_PATH" "$CERT_PATH"

echo "🎉 Certificate verification completed!"
