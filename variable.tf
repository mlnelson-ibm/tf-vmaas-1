variable "vcd_vdc" {
  type        = string
  description = "This is the VMware as a Service Virtual Data Center for the environment"
}

variable "vcd_user" {
  type        = string
  description = "This is the VMware as a Service user."
}

variable "vcd_pass" {
  type        = string
  description = "This is the VMware as a Service password for the environment"
}

variable "vcd_org" {
  type        = string
  description = "This is the VMware as a Service organization string from the console for the environment"
}

variable "vcd_url" {
  type        = string
  description = "This is the VMware as a Service URL for the environment."
}