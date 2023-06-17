# Create a security group for the frontend web app
resource "aws_security_group" "frontend_sg" {
  name              = var.frontend_sg_name
  description       = "Security group for the frontend web app"
  vpc_id            = var.frontend_vpc_id

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a security group for the admin web app
resource "aws_security_group" "admin_sg" {
  name              = var.admin_sg_name
  description = "Security group for the admin web app"
  vpc_id            = var.admin_vpc_id

  ingress {
    from_port   = 3001
    to_port     = 3001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create a security group for the backend web app
resource "aws_security_group" "backend_sg" {
  name        = var.backend_sg_name
  description = "Security group for the backend web app"
  vpc_id      = var.backend_vpc_id

  ingress {
    from_port   = 5002
    to_port     = 5002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# locals {
  
#   security_groups = {
#     frontend = {
#       name              = var.frontend_sg_name
#       description       = "Security group for the frontend web app"
    #   vpc_id            = var.frontend_vpc_id
    #   port              = 3000
    #   egress_sg         = [aws_security_group.frontend_sg.id]
    # },
    # admin = {
    #   name              = var.admin_sg_name
    #   description       = "Security group for the admin web app"
    #   vpc_id            = var.admin_vpc_id
    #   port              = 3001
    #   egress_sg         = [aws_security_group.admin_sg.id]
    # },
    # backend = {
    #   name              = var.backend_sg_name
    #   description       = "Security group for the backend web app"
#       vpc_id            = var.backend_vpc_id
#       port              = 5002
#       egress_sg         = [aws_security_group.backend_sg.id]
#     }
#   }
# }

# resource "aws_security_group" "frontend_sg" {
#   for_each     = local.security_groups["frontend"]

#   name        = each.value.name
#   description = each.value.description
#   vpc_id      = each.value.vpc_id

#   ingress {
#     from_port   = each.value.port
#     to_port     = each.value.port
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
  # }

  # egress {
  #   from_port       = 0
  #   to_port         = 0
  #   protocol        = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "admin_sg" {
#   for_each     = local.security_groups["admin"]

#   name        = each.value.name
#   description = each.value.description
#   vpc_id      = each.value.vpc_id

#   ingress {
#     from_port   = each.value.port
#     to_port     = each.value.port
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
  # }

  # egress {
  #   from_port       = 0
  #   to_port         = 0
  #   protocol        = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
#   }
# }

# resource "aws_security_group" "backend_sg" {
#   for_each     = local.security_groups["backend"]

#   name        = each.value.name
#   description = each.value.description
#   vpc_id      = each.value.vpc_id

#   ingress {
#     from_port   = each.value.port
#     to_port     = each.value.port
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
  # }

  # egress {
  #   from_port       = 0
  #   to_port         = 0
  #   protocol        = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
#   }
# }
