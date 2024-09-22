output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.example.id  # Change 'example' to your VPC resource name if different
}