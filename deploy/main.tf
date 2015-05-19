# Define Heroku Provider and Settings
provider "heroku" {
  email   = "${var.heroku_email}"
  api_key = "${var.heroku_api_key}"
}

# Heroku Web Dyno
resource "heroku_app" "web" {
  name    = "pizza-calc"
  region  = "us"
  stack   = "cedar-14"

  config_vars {
    ERROR_PAGE_URL = "http://pizzacalc.website/404.html"
  }
}

# Associate domain
resource "heroku_domain" "web" {
  app      = "${heroku_app.web.name}"
  hostname = "pizzacalc.website"
}

# Papertrail Addon
resource "heroku_addon" "webhook" {
  app  = "${heroku_app.web.name}"
  plan = "papertrail"
}
