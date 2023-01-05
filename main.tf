resource "vcd_network_isolated_v2" "isolated_network" {
  name        = "myTestNetwork"
  gateway       = "10.254.0.1"
  prefix_length = 24
}