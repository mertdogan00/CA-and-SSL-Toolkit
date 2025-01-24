# 🌟 CA-and-SSL-Toolkit

This project enables you to create your own Certificate Authority (CA), manage SSL/TLS certificates, and integrate them with web servers. Built with the power of OpenSSL. 🔐

---

## 🚀 Features

- 🏛️ **Generate Root and Intermediate CAs:** Set up your Certificate Authority structure effortlessly.
- 📝 **CSR Management:** Create and sign Certificate Signing Requests (CSRs) with ease.
- 🔒 **Self-Signed Certificates:** Quickly generate certificates for testing purposes.
- ❌ **Revoke Certificates:** Manage and revoke issued certificates, updating Certificate Revocation Lists (CRLs).
- 🌐 **Web Server Integration:** Easily configure SSL/TLS for NGINX or other web servers.

---

## ⚙️ Prerequisites

- **OpenSSL:** Ensure that OpenSSL is installed on your system. It is required for all the operations. Install it using your package manager:
  - On Ubuntu/Debian: `sudo apt install openssl`
  - On Red Hat/CentOS: `sudo yum install openssl`
  - On macOS: `brew install openssl`
- **Bash Shell:** The scripts are written in Bash and should work on any Unix-based system.

---

## 🛠️ How to Use:

### 1️⃣ Clone the Repository:

```bash
git clone https://github.com/kullaniciadi/CA-and-SSL-Toolkit.git
cd CA-and-SSL-Toolkit

```

---

## 📂 Project Structure:

```plaintext

CA-and-SSL-Toolkit/
├── README.md                 # Documentation
├── LICENSE                   # License file
├── ca/                       # CA-related files
│   ├── rootCA.key            # Root CA private key
│   ├── rootCA.pem            # Root CA certificate
│   ├── intermediateCA.key    # Intermediate CA private key
│   ├── intermediateCA.pem    # Intermediate CA certificate
│   └── ca_database/          # Issued and revoked certificates database
├── examples/                 # Usage examples
│   ├── site_csr_example.sh   # CSR generation for a site
│   ├── site_cert_example.sh  # Certificate signing example
│   └── nginx_config_example  # NGINX configuration example
├── scripts/                  # Automation scripts
│   ├── create_ca.sh          # Root and Intermediate CA creation
│   ├── generate_csr.sh       # CSR generation
│   ├── sign_certificate.sh   # Signing CSRs
│   ├── verify_certificate.sh # Certificate validation
│   ├── revoke_certificate.sh # Certificate revocation
│   └── generate_self_signed.sh # Self-signed certificate creation

```

---

## 🔍 Examples:

- 📄 **CSR Example:** [examples/site_csr_example.sh](examples/site_csr_example.sh)
- 🌐 **NGINX Configuration Example:** [examples/nginx_config_example](examples/nginx_config_example)

---

## 📜 License:

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details. 🎉

---

## 🌟 Contribution:

We welcome contributions! Feel free to fork the repository, submit pull requests, or open issues to improve this project. 🤝
