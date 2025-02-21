resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = mongodbatlas_project.free-atlas-project.id
  ip_address = local.atlas_pub_ip_of_terraform_machine_calling_atlas_control_plane_with_api_key
  comment    = "created via terraform"
}