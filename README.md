# Multi Environment Pipeline Dev, Stage, Prod

Deploys the same Terraform stack to **dev**, **stage**, **prod** using:
- Branches == environments (`dev`, `stage`, `prod`)
- GitHub **Environments** for approvals & per‑env secrets
- AWS **OIDC** (no long‑lived keys) to assume per‑env roles


## Quick Start
### Create S3 state + DynamoDB lock** (one‑time, per account):
```bash
aws s3 mb s3://<your-state-bucket>
aws dynamodb create-table \
--table-name <your-lock-table> \
--attribute-definitions AttributeName=LockID,AttributeType=S \
--key-schema AttributeName=LockID,KeyType=HASH \
--billing-mode PAY_PER_REQUEST
```