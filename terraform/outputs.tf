output "visitor_counter_url" {
  description = "HTTPS endpoint for the portfolio visitor counter"
  value       = "${aws_apigatewayv2_api.visitor_counter_api.api_endpoint}/count"
}