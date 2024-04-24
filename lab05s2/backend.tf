terraform {
  backend "azurerm" {
    resource_group_name  = "tfstaten01610235RG"
    storage_account_name = "tfstaten01610235sa"
    container_name       = "tfstatefiles"
    key                  = "terraform.tfstate"
    access_key           = "wXuH7iih1MbcOPqIjU8NU8i0QlIzaOIXar+yLdG1d45Q3m96Oukt6dt8apKPjfzPIzcs0YHoCEoA+ASt0oWwyw=="
  }
}
