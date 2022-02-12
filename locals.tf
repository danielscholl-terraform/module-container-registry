##############################################################
# This module allows the creation of a Container Registry
##############################################################

locals {
    name = (var.name != null ? substr(var.name, 0, 23) : substr("${var.names.product}${var.names.environment}", 0, 18))
}
