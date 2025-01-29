#!/bin/bash

# Generate a CSR and private key for a server

# Define variable
variable="server_1"

# Generate private key
echo "🔑 Generating private key for $variable..."
openssl genrsa -out ../crt/$variable.key 2048

# Create CSR
echo "📄 Creating CSR for $variable..."
openssl req -new -key ../crt/$variable.key -out ../crt/$variable.csr \
  -subj "/C=US/ST=California/L=San Francisco/O=ExampleCorp/OU=IT/CN=$variable"

echo "🎉 CSR and private key for $variable have been successfully created!"

