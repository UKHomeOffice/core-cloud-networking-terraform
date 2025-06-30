# AWS Transit Gateway Peering Setup (Central Hub Model)

This Terraform module provisions **Transit Gateway peering attachments** between a **central hub TGW** and HUB TGWs in other environments (`prod`, `notprod`, `central`).

---

##  Features

- Creates peering attachments from a central TGW to environment-specific TGWs.
- Handles `central` TGW-to-hub TGW peering logic.
- Custom `tags` per environment.
- Outputs peering attachment IDs for use in accepter setup.

---

## Inputs

### `central_hub_tgw_id`
- **Type**: `string`
- **Description**: The Transit Gateway ID of the central hub (used as the source for most peerings).

### `accounts`
- **Type**: `map(object)`
- **Description**: A map of environment accounts and their TGW configurations.

##  Accepting TGW Peering Attachments

To complete the peering setup, you must accept the attachment in each **peer account** using the following resource:

```hcl
resource "aws_ec2_transit_gateway_peering_attachment_accepter" "accept_from_central" {
  transit_gateway_attachment_id = "<peering_attachment_id>"
  tags = {
    Name = "accept-from-central"
  }
}
