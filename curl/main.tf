data "http" "example" {
  url = "https://petstore.swagger.io/v2/store/inventory"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }

  lifecycle {
    postcondition {
      condition     = contains([200, 401], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

output "text" {
  value = data.http.example.response_body
}
