resource "aws_ecs_task_definition" "tdtf" {
  family = "tdtf"
  requires_compatibilities = ["EC2"]
  network_mode             = "awsvpc"
  cpu                      = 1024
  memory                   = 1024
  execution_role_arn       = "arn:aws:iam::592961669335:role/ecsTaskExecutionRole"
  container_definitions = jsonencode([
    {
      name      = "first-con"
      image     = "public.ecr.aws/l9t7b5s8/ecrtf:latest"
      cpu       = 10
      memory    = 512
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 3000
        }
    ]
    }
  ])

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture        = "X86_64"
  }
}


    
  #     {
#       name      = "second-con"
#       image     = "service-second"
#       cpu       = 10
#       memory    = 256
#       essential = true
#       portMappings = [
#         {
#           containerPort = 443
#           hostPort      = 443
#         }
#       ]
#     }
#   ])

#   volume {
#     name      = "service-storage"
#     host_path = "/ecs/service-storage"
#   }

#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
#   }
# }
