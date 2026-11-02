output "vpc_id" {
  description = "VPC id"
  value       = module.network.vpc_id
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = module.eks.cluster_name
}

output "cluster_endpoint" {
  description = "EKS API server endpoint"
  value       = module.eks.cluster_endpoint
}

output "db_endpoint" {
  description = "RDS PostgreSQL endpoint"
  value       = module.rds.db_endpoint
}

output "cluster_log_group" {
  description = "CloudWatch log group for the cluster"
  value       = module.observability.log_group_name
}
