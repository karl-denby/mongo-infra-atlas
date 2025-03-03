# Create a Database User
resource "mongodbatlas_database_user" "db-user" {
  username = "terraformed-user"
  password = "abcd1234!"
  project_id = mongodbatlas_project.free-atlas-project.id
  auth_database_name = "admin"
  roles {
    role_name     = "readWrite"
    database_name = "test"
  }
}
