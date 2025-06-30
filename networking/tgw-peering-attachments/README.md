# Transit Gateway Peering Attachments

This Terraform module creates Transit Gateway (TGW) peering attachments from a **central hub TGW** to:

- `central_tgw` (same or different account)
- `prod_hub_tgw`
- `notprod_hub_tgw`

It supports both **same-account** and **cross-account** TGW peering within the same region.

## 📍 Prerequisites

- All TGWs must be in the same AWS region (`eu-west-2`)
- Cross-account peering requires the **peer account to accept the attachment** via `aws_ec2_transit_gateway_peering_attachment_accepter`
- Appropriate IAM permissions to create and accept TGW peering attachments

## 🧾 Terraform Inputs

| Name                | Type   | Description                                      | Example                        |
|---------------------|--------|--------------------------------------------------|--------------------------------|
| `central_hub_tgw_id`| string | The ID of the central hub TGW initiating peering | `"tgw-0abc..."`                |
| `central_tgw_id`    | string | The ID of the other central TGW                  | `"tgw-0def..."`                |
| `prod_hub_tgw_id`   | string | The ID of the prod TGW                           | `"tgw-0abc..."`                |
| `prod_account_id`   | string | AWS Account ID of the prod TGW                   | `"123456789012"`               |
| `notprod_hub_tgw_id`| string | The ID of the notprod TGW                        | `"tgw-0xyz..."`                |
| `notprod_account_id`| string | AWS Account ID of the notprod TGW                | `"123456789012"`               |
| `region`            | string | AWS Region where TGWs are located                | `"eu-west-2"`                  |

## 🏗️ Resources Created

- `aws_ec2_transit_gateway_peering_attachment.to_central_tgw`
- `aws_ec2_transit_gateway_peering_attachment.to_prod_hub`
- `aws_ec2_transit_gateway_peering_attachment.to_notprod_hub`

## 🔁 Accepting TGW Peering Attachments

To complete the peering setup, you must accept the attachment in each **peer account** using the following resource:

```hcl
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_from_central" {
  transit_gateway_attachment_id = "<peering_attachment_id>"
  tags = {
    Name = "accept-from-central"
  }
}
