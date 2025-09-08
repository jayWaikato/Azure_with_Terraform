# 🌐 Azure Infrastructure with Terraform  
*Automated, modular, and environment-aware Infrastructure as Code (IaC) for Microsoft Azure*  

---

## 📖 Overview
This project provides a **modular Terraform framework** to deploy and manage core Azure infrastructure components.  
It is designed for **repeatability, scalability, and security** across multiple environments (Dev, Prod).  

---

## ✨ Key Features
- 🔐 **DevOps Module** → Resource Groups, Key Vault, Log Analytics integration  
- 📦 **Infra Lifecycle** → Storage Accounts and lifecycle resources  
- 🌍 **Networking** → Virtual Networks, Subnets, Network Security Groups  
- 💻 **Virtual Machines** → Public IP, subnet attachment, and remote access users  
- 📊 **Observability** → Log Analytics Workspace for monitoring and logging  
- ⚙️ **Environment Separation** → `dev.tfvars` and `prod.tfvars` for consistent deployments  
---

## 🛠 Tech Stack
- [Terraform](https://developer.hashicorp.com/terraform) (>=1.x)  
- [AzureRM Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest)  
- [Azure CLI](https://learn.microsoft.com/en-us/cli/azure/)  
- Bash (for scripts)  

---

## 🚀 Getting Started

### 1️⃣ Clone the Repository
```bash
git clone https://github.com/jayWaikato/Azure_with_Terraform.git
cd Azure_with_Terraform
```

### 2️⃣ Install Prerequisites
- Install **Terraform**  
- Install **Azure CLI**, then login:
  ```bash
  az login
  ```

### 3️⃣ Initialize Terraform
```bash
cd network    # or vm, observability, etc.
terraform init
```

### 4️⃣ Deploy Infrastructure
**Dev Environment**:
```bash
terraform apply -var-file=env/dev.tfvars
```

**Prod Environment**:
```bash
terraform apply -var-file=env/prod.tfvars
```

---

## 🖥 Usage Example – VM Deployment
```bash
cd vm
./.debug-dev.sh apply -var-file=env/dev.tfvars
```

This will:  
✔️ Create a VM with public IP  
✔️ Attach it to the `snet-bravo` subnet  
✔️ Configure remote access users  

---

## 🏗 Architecture Diagram

```mermaid
flowchart TB
    subgraph Terraform["Terraform CLI"]
        A[Terraform Apply/Plan]
    end

    subgraph Provider["AzureRM Provider"]
        B[Azure Provider]
    end

    A --> B

    subgraph Azure["Azure Cloud"]
        C1[DevOps Module<br/>Resource Groups + Key Vault + Monitoring]
        C2[Infra-Lifecycle<br/>Storage Accounts]
        C3[Network<br/>VNet + Subnets + NSGs]
        C4[VM Module<br/>Virtual Machines + Public IPs + Remote Access]
        C5[Observability<br/>Log Analytics Workspace]
    end

    B --> C1
    B --> C2
    B --> C3
    B --> C4
    B --> C5

    %% Environment swimlanes
    subgraph Dev["Dev Environment"]
        C1 --> D1
        C2 --> D2
        C3 --> D3
        C4 --> D4
        C5 --> D5
    end

    subgraph Prod["Prod Environment"]
        C1 --> P1
        C2 --> P2
        C3 --> P3
        C4 --> P4
        C5 --> P5
    end
```

---

## 🔍 Scripts
```bash
./.debug-dev.sh
./.debug-prod.sh
```

---

## 🏅 Suggested Badges
(Add once CI/CD pipelines are integrated)  
- ![Terraform](https://img.shields.io/badge/Terraform-1.x-blueviolet)  
- ![Build](https://img.shields.io/github/actions/workflow/status/jayWaikato/Azure_with_Terraform/ci.yml)  
- ![License](https://img.shields.io/github/license/jayWaikato/Azure_with_Terraform)  

---
