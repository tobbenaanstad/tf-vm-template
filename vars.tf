variable "subscription_id" {
  type        = string
  description = "The subcription id"
  default     = "67d2d27d-f705-4120-b07d-189ee8e658c9"

}

variable "network-vnet-cidr" {
  type        = string
  description = "The CIDR of the network VNET"
  default     = "10.0.0.0/16"
}

variable "network-subnet-cidr" {
  type        = string
  description = "The CIDR for the network subnet"
  default     = "10.0.2.0/24"
}

variable "location" {
  type = string
  description = "Location"
  default = "West Europe"
}

