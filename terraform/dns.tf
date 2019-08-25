# dmar.by domain configuration
resource "digitalocean_domain" "dmar_by" {
  name       = "dmar.by"
  ip_address = "${digitalocean_floating_ip.dmarby.ip_address}"
}

resource "digitalocean_record" "dmar_by_aaaa" {
  domain = "${digitalocean_domain.dmar_by.name}"
  type   = "AAAA"
  name   = "@"
  value  = "${digitalocean_droplet.dmarby.ipv6_address}"
  ttl    = 60
}

# CAA records
resource "digitalocean_record" "dmar_by_caa_issue" {
  domain = "${digitalocean_domain.dmar_by.name}"

  name  = "@"
  type  = "CAA"
  value = "letsencrypt.org."
  flags = 128
  tag   = "issue"
  ttl   = 60
}

resource "digitalocean_record" "dmar_by_caa_iodef" {
  domain = "${digitalocean_domain.dmar_by.name}"

  name  = "@"
  type  = "CAA"
  value = "mailto:david@dmarby.se."
  flags = 128
  tag   = "iodef"
  ttl   = 60
}

# dmarby.se domain configuration
resource "digitalocean_domain" "dmarby" {
  name = "dmarby.se"

  ip_address = "${digitalocean_floating_ip.dmarby.ip_address}"
}

resource "digitalocean_record" "dmarby_aaaa" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "AAAA"
  name   = "@"
  value  = "${digitalocean_droplet.dmarby.ipv6_address}"
  ttl    = 60
}

# CAA records

resource "digitalocean_record" "dmarby_caa_issue" {
  domain = "${digitalocean_domain.dmarby.name}"

  name  = "@"
  type  = "CAA"
  value = "letsencrypt.org."
  flags = 128
  tag   = "issue"
  ttl   = 60
}

resource "digitalocean_record" "dmarby_caa_iodef" {
  domain = "${digitalocean_domain.dmarby.name}"

  name  = "@"
  type  = "CAA"
  value = "mailto:david@dmarby.se."
  flags = 128
  tag   = "iodef"
  ttl   = 60
}

# CNAME records for subdomains
resource "digitalocean_record" "dmarby_www" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "CNAME"
  name   = "www"
  value  = "dmarby.se."
  ttl    = 60
}

resource "digitalocean_record" "dmarby_dump" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "CNAME"
  name   = "dump"
  value  = "dmarby.se."
  ttl    = 60
}

# CNAME records for Google Suite
resource "digitalocean_record" "dmarby_mail" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "CNAME"
  name   = "mail"
  value  = "ghs.google.com."
  ttl    = 60
}

resource "digitalocean_record" "dmarby_calendar" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "CNAME"
  name   = "calendar"
  value  = "ghs.google.com."
  ttl    = 60
}

# TXT Records
resource "digitalocean_record" "dmarby_google" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "TXT"
  name   = "@"
  value  = "google-site-verification=IAo4ufn7P4Y1SDWIKWE8oIh0FuUFRiNYfpgEv7ORqQw"
  ttl    = 60
}

resource "digitalocean_record" "dmarby_dkim" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "TXT"
  name   = "google._domainkey"
  value  = "v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjWKeB+MTGJm9FkwVinrVnAkEJbRNZhBBEujQuIwnWTVzAgTtGz6WK+YGtQwVpZMScXiS0TOFziq6iTmhjTqw+aXdxduH9/0UuG40SM8BuljoVWupeH9JihrgV6zM1LonHYZBMxNTA9wXKkp6WkyKMKdkLA1w0NUXrcwpaWHYIfdRmUzPcgdphtHck0VZSU380JgJX/N52PwcEX34CLIkhc6ow3hMQZeI9gxTbT1UMKQ4llkk/Lw1UxyF+rIYG4x0qY6woduRjD7sjsAb0NF4QgeUOQKZBBkZg2YnS2qjyrGQ7OXN70HgcUi0UhLwrkXIQOLzBFWJgyNzj/AUtEYTkwIDAQAB"
  ttl    = 60
}

resource "digitalocean_record" "dmarby_spf" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 include:_spf.google.com ~all"
  ttl    = 60
}

# MX Records
resource "digitalocean_record" "dmarby_home_mx1" {
  domain   = "${digitalocean_domain.dmarby.name}"
  type     = "MX"
  name     = "@"
  value    = "aspmx.l.google.com."
  ttl      = 60
  priority = 1
}

resource "digitalocean_record" "dmarby_home_mx2" {
  domain   = "${digitalocean_domain.dmarby.name}"
  type     = "MX"
  name     = "@"
  value    = "alt1.aspmx.l.google.com."
  ttl      = 60
  priority = 5
}

resource "digitalocean_record" "dmarby_home_mx3" {
  domain   = "${digitalocean_domain.dmarby.name}"
  type     = "MX"
  name     = "@"
  value    = "alt2.aspmx.l.google.com."
  ttl      = 60
  priority = 5
}

resource "digitalocean_record" "dmarby_home_mx4" {
  domain   = "${digitalocean_domain.dmarby.name}"
  type     = "MX"
  name     = "@"
  value    = "alt3.aspmx.l.google.com."
  ttl      = 60
  priority = 10
}

resource "digitalocean_record" "dmarby_home_mx5" {
  domain   = "${digitalocean_domain.dmarby.name}"
  type     = "MX"
  name     = "@"
  value    = "alt4.aspmx.l.google.com."
  ttl      = 60
  priority = 10
}

# Delegate home.dmarby.se as it's own domain
resource "digitalocean_record" "dmarby_home_ns1" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "NS"
  name   = "home"
  value  = "ns1.digitalocean.com."
  ttl    = 60
}

resource "digitalocean_record" "dmarby_home_ns2" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "NS"
  name   = "home"
  value  = "ns2.digitalocean.com."
  ttl    = 60
}

resource "digitalocean_record" "dmarby_home_ns3" {
  domain = "${digitalocean_domain.dmarby.name}"
  type   = "NS"
  name   = "home"
  value  = "ns3.digitalocean.com."
  ttl    = 60
}
