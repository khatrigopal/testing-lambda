variable "function_configurations" {
  type = list(object({
    function_name   = string
    handler         = string
    runtime         = string
    code_directory  = string
    layer_arn = string
    memory_size = number
  }))
}

