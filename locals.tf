##############################################################
# This module allows the creation of a Container Registry
##############################################################

locals {
  name = substr("${var.names.product}${var.names.environment}${var.names.location}cr", 0, 23)
}
