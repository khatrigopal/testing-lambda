module "lambda_functions" {
  source = "./modules/lambda_functions"

  function_configurations = [
    {
      function_name   = "function1"
      handler         = "lambda_function1.handler"
      runtime         = "python3.8"
      code_directory  = "function1"
    },
    {
      function_name   = "function2"
      handler         = "lambda_function2.handler"
      runtime         = "python3.8"
      code_directory  = "function2"
    }
  ]
}


output "function1_arn" {
  value = module.lambda_functions.lambda_functions["function1"].arn
}

output "function2_arn" {
  value = module.lambda_functions.lambda_functions["function2"].arn
}
