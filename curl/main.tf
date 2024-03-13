data "http" "example" {
  url = "http://10.243.64.8:8000"

  # Optional request headers
  request_headers = {
    Accept = "application/json"
  }

  lifecycle {
    postcondition {
      condition     = contains([401], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

output "text" {
  value = data.http.example.response_body
}
