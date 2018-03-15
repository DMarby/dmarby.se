# dmarby.se domain configuration
# resource "digitalocean_domain" "dmarby" {
#   name       = "dmarby.se"
#   ip_address = "${digitalocean_droplet.dmarby.ipv4_address}"
# }

# resource "digitalocean_record" "dmarby_aaaa" {
#   domain = "${digitalocean_domain.dmarby.name}"
#   type   = "AAAA"
#   name   = "@"
#   value  = "${digitalocean_droplet.dmarby.ipv6_address}"
#   ttl    = 60
# }

# dmar.by domain configuration
resource "digitalocean_domain" "dmar_by" {
  name       = "dmar.by"
  ip_address = "${digitalocean_droplet.dmarby.ipv4_address}"
}

resource "digitalocean_record" "dmar_by_aaaa" {
  domain = "${digitalocean_domain.dmar_by.name}"
  type   = "AAAA"
  name   = "@"
  value  = "${digitalocean_droplet.dmarby.ipv6_address}"
  ttl    = 60
}
