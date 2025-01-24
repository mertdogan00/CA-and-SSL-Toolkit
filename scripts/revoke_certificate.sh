#!/bin/bash

CERT_PATH="../ca/revoked_cert.pem"

if [ ! -f "$CERT_PATH" ]; then
  echo "❌ Certificate to be revoked not found!"
  exit 1
fi

echo "❌ Revoking certificate..."
openssl ca -revoke "$CERT_PATH"

echo "📄 Generating updated CRL..."
openssl ca -gencrl -out ../ca/ca.crl

echo "🎉 Certificate revoked and CRL updated!"
