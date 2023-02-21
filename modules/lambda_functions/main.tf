variable "function_configurations" {
  type = list(object({
    function_name   = string
    handler         = string
    runtime         = string
    code_directory  = string
  }))
}

output "lambda_functions" {
  value = { for c in var.function_configurations : c.function_name => aws_lambda_function.lambda_functions[c.function_name] }
}

resource "aws_lambda_function" "lambda_functions" {
  for_each        = { for c in var.function_configurations : c.function_name => c }
  function_name   = each.value.function_name
  #role            = "arn:aws:iam::558940753150:role/lambda-full-acces"
  role            = "arn:aws:iam::558940753150:role/lambda_custom_role"
  handler         = each.value.handler
  #handler         = each.value.lamdba_handler  
  runtime         = each.value.runtime
  source_code_hash = filebase64sha256(data.archive_file.lambda_functions[each.key].output_path)
  filename        = data.archive_file.lambda_functions[each.key].output_path
}

data "archive_file" "lambda_functions" {
  for_each  = { for c in var.function_configurations : c.function_name => c }
  type      = "zip"
  source_dir = each.value.code_directory
  output_path = "${path.module}/${each.key}.zip"
}
