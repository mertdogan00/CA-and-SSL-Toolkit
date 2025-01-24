#!/bin/bash

CSR_PATH="../ca/domain.csr"
OUTPUT_CERT="../ca/domain.crt"

if [ ! -f "$CSR_PATH" ]; then
  echo "❌ CSR file not found!"
  exit 1
fi

echo "📄 Signing CSR with Intermediate CA..."
openssl x509 -req -in "$CSR_PATH" -CA ../ca/intermediateCA.pem -CAkey ../ca/intermediateCA.key -CAcreateserial \
  -out "$OUTPUT_CERT" -days 5475 -sha256

echo "🎉 Certificate signed and created successfully!"
