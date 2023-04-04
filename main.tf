module "lambda_functions" {
  source = "./modules/lambda_functions"

  function_configurations = [
    {
      function_name   = "function1"
      handler         = "function1.lambda_handler"
      runtime         = "python3.8"
      code_directory  = "function1"
      #layer_arn = "arn:aws:lambda:us-east-1:558940753150:layer:my_layer_2:3"
      #layers = "arn:aws:lambda:us-east-1:558940753150:layer:my_layer_1:5"
       layers = "data.terraform_remote_state.networking.outputs.layers.layers[0].arn"
      role = "arn:aws:iam::558940753150:role/lambda_custom_role"
      memory_size        = 128
    }
    
  ]
}


output "function1_arn" {
  value = module.lambda_functions.lambda_functions["function1"].arn
}

