module "lambda_functions" {
  source = "./modules/lambda_functions"

  function_configurations = [
    {
      function_name   = "function1"
      handler         = "function1.lambda_handler"
      runtime         = "python3.8"
      code_directory  = "function1"
      #layer_arn = "arn:aws:lambda:us-east-1:558940753150:layer:my_layer_2:3"
      #layers = "arn:aws:lambda:us-east-1:558940753150:layer:my_layer_2:3"
      role = "arn:aws:iam::558940753150:role/lambda_custom_role"
      memory_size        = 128
    },
    {
      function_name   = "function2"
      handler         = "function2.lambda_handler"
      runtime         = "python3.8"
      code_directory  = "function2"
      role = "arn:aws:iam::558940753150:role/lambda_custom_role"
      #layer_arn = "arn:aws:lambda:us-east-1:558940753150:layer:my_layer_2:3"
      #layers = "arn:aws:lambda:us-east-1:558940753150:layer:my_layer_2:3"
      memory_size        = 128
    }
  ]
}


output "function1_arn" {
  value = module.lambda_functions.lambda_functions["function1"].arn
}

output "function2_arn" {
  value = module.lambda_functions.lambda_functions["function2"].arn
}
