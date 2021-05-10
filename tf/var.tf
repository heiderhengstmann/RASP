variable "client_id" {
    default = "2def35a1-fc91-43d1-9234-b04ca9f1ea7a"
}
variable "client_secret" {
    default = "8uL6DFjE2.~D0Z0q~Yjz7W9U0kKVy.W15."
}

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "pocrasp"
}

variable cluster_name {
    default = "k8stest"
}

variable resource_group_name {
    default = "pocrasp-rg"
}

variable location {
    default = "Central US"
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "eastus"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}

variable "prefix" {
  description = "A prefix used for all resources in this example"
  default = "pocrasp-"
}

variable "admin_username" {
  description = "name"
  default = "hohn"
}

variable "admin_password" {
  description = "pass"
  default = "L34ndr0.hdrblm"
}
