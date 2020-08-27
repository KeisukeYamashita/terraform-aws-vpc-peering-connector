resource "aws_vpc_peering_connection_accepter" "this" {
  vpc_peering_connection_id = var.target_peering_id
  auto_accept               = var.auto_accept
}

resource "aws_route" "this" {
  route_table_id            = var.route_table_id
  destination_cidr_block    = var.target_cidr_block
  vpc_peering_connection_id = var.target_peering_id
}
