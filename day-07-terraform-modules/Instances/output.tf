output "public_instance_id" {
  value = aws_instance.public.id
}
output "public_ip" {
  value = aws_instance.public.public_ip
}


output "frontend_instance_id" {
  value = aws_instance.frontend.id
}
output "frontend_private_ip" {
  value = aws_instance.frontend.private_ip
}


output "backend_instance_id" {
  value = aws_instance.backend.id
}
output "backend_private_ip" {
  value = aws_instance.backend.private_ip
}
