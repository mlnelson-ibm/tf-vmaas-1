data "vcd_resource_list" "list_of_edges" {
  name =  "list_of_edges"
  resource_type = "vcd_nsxt_edgegateway"
  list_mode = "name"
  vdc = var.vcd_vdc
}

data "vcd_nsxt_edgegateway" "t1" {
  name     = data.vcd_resource_list.list_of_edges.list[0]
}

resource "vcd_nsxt_ipsec_vpn_tunnel" "tunnel1" {

  edge_gateway_id = data.vcd_nsxt_edgegateway.t1.id

  name        = "First"
  description = "testing tunnel"

  pre_shared_key = "thisisasecret"
  # Primary IP address of Edge Gateway pulled from data source
  local_ip_address = tolist(data.vcd_nsxt_edgegateway.t1.subnet)[0].primary_ip
  local_networks   = ["192.168.100.0/24"]
  # That is a fake remote IP address
  remote_ip_address = "169.46.39.226"
  remote_networks   = ["10.176.68.64/26"]

  security_profile_customization {
    ike_version               = "IKE_V2"
    ike_encryption_algorithms = ["AES_256"]
    ike_digest_algorithms     = ["SHA2_256"]
    ike_dh_groups             = ["GROUP14"]
    ike_sa_lifetime           = 28800

    tunnel_pfs_enabled           = true
    tunnel_df_policy             = "COPY"
    tunnel_encryption_algorithms = ["AES_256"]
    tunnel_digest_algorithms     = ["SHA2_256"]
    tunnel_dh_groups             = ["GROUP14"]
    tunnel_sa_lifetime           = 3600

    dpd_probe_internal = "30"
  }
}