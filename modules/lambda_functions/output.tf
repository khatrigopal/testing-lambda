output "lambda_functions" {
  value = { for c in var.function_configurations : c.function_name => aws_lambda_function.lambda_functions[c.function_name] }
}
