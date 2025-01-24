#!/bin/bash

# Sign the CSR with the Intermediate CA
echo "📄 Signing mysite.com CSR with Intermediate CA..."
openssl x509 -req -in ../examples/mysite.com.csr -CA ../ca/intermediateCA.pem -CAkey ../ca/intermediateCA.key \
  -CAcreateserial -out ../examples/mysite.com.crt -days 365 -sha256

echo "🎉 SSL certificate for mysite.com created and signed by Intermediate CA!"
