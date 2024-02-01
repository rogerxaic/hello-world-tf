variable "ibmcloud_api_key" {
  default = null
}

provider "ibm" {
  region              = "eu-de"
  visibility          = "public"
  ibmcloud_api_key    = var.ibmcloud_api_key
}

resource "ibm_is_vpc" "example" {
  name = "example-vpc-unique"
}

terraform {
  required_version = ">= 1.3.0"
  required_providers {
    # Use "greater than or equal to" range in modules
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = ">= 1.59.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.6.0"
    }
  }
}
