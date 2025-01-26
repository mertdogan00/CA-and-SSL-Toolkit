#!/bin/bash

# CSR and Private Key Generation Script for GlusterFS Server (e.g., gluster1)

# Generate a private key
echo "🔑 Generating a private key for GlusterFS server..."
openssl genrsa -out ../crt/server.key 2048

# Create a CSR (Certificate Signing Request)
echo "📄 Creating a CSR for the GlusterFS server..."
openssl req -new -key ../crt/server.key -out ../crt/server.csr \
  -subj "/C=XX/ST=YourState/L=YourCity/O=YourOrganization/OU=YourDepartment/CN=gluster1"

echo "🎉 CSR and private key successfully generated for the GlusterFS server!"
