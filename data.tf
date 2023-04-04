data "terraform_remote_state" "networking" {
  backend = "s3"
  config = {
    bucket = "khatrig-githubaction"
    key = "layer-new.tfstate"
    region = "us-east-1"
  }
}
