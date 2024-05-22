resource "aws_ecrpublic_repository" "test" {

  repository_name = "ecrtf"

  tags = {
    env = "production"
  }
}
