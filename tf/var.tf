variable "client_id" {
    default = "f83cd753-b8ab-41e7-a997-130247259fcf"
}
variable "client_secret" {
    default = "CFxN.2ucE~AkIQkm5_IFaXYwQWDetLRrT5"
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
