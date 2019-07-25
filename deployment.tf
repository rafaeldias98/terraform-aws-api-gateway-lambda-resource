resource "aws_api_gateway_deployment" "deployment" {
  rest_api_id = aws_api_gateway_rest_api.api.id
  stage_name  = ""
  depends_on  = [aws_api_gateway_integration.lambda_integration]
}

resource "aws_api_gateway_stage" "stage" {
  stage_name    = var.api_gateway_stage_name
  rest_api_id   = aws_api_gateway_rest_api.api.id
  deployment_id = aws_api_gateway_deployment.deployment.id
}
