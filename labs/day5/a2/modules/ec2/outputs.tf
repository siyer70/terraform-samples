output "webserver_id" {
  value = aws_instance.webserver.id
}

output "appserver_id" {
  value = aws_instance.appserver.id
}

output "dbserver_id" {
  value = aws_instance.dbserver.id
}