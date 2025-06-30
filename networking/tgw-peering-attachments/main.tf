
resource "aws_ec2_transit_gateway_peering_attachment" "to_central_tgw" {
  transit_gateway_id          = var.central_hub_tgw_id
  peer_transit_gateway_id     = var.central_tgw_id
  peer_region                 = var.region
  tags = {
    Name = "central-hub-to-central"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "to_prod_hub" {
  transit_gateway_id          = var.central_hub_tgw_id
  peer_transit_gateway_id     = var.prod_hub_tgw_id
  peer_account_id             = var.prod_account_id
  peer_region                 = var.region
  tags = {
    Name = "central-hub-to-prod-hub"
  }
}

resource "aws_ec2_transit_gateway_peering_attachment" "to_notprod_hub" {
  provider                    = aws.central
  transit_gateway_id          = var.central_hub_tgw_id
  peer_transit_gateway_id     = var.notprod_hub_tgw_id
  peer_account_id             = var.notprod_account_id
  peer_region                 = var.region
  tags = {
    Name = "central-hub-to-notprod-hub"
  }
}
