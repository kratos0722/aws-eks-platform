module "network" {
  source   = "./modules/network"
  project  = var.project
  vpc_cidr = var.vpc_cidr
  azs      = var.azs
}

module "eks" {
  source             = "./modules/eks"
  project            = var.project
  subnet_ids         = module.network.private_subnet_ids
  cluster_version    = var.cluster_version
  node_instance_type = var.node_instance_type
  node_scaling       = var.node_scaling
}

module "rds" {
  source            = "./modules/rds"
  project           = var.project
  vpc_id            = module.network.vpc_id
  subnet_ids        = module.network.private_subnet_ids
  allowed_cidr      = var.vpc_cidr
  db_username       = var.db_username
  db_password       = var.db_password
  db_instance_class = var.db_instance_class
}

module "observability" {
  source       = "./modules/observability"
  cluster_name = module.eks.cluster_name
}
