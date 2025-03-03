# configure terraform so it knows where to download atlas from
#  otherwise it will try download hashicorp/mongodbatlas which doesn't exist
terraform {
  required_providers {
    mongodbatlas = {
      source = "mongodb/mongodbatlas"
    }
  }
}

# Configure the MongoDB Atlas Provider
#  we don't give keys here we put them in the variables.tf file, terraform is smart enough
#  to look at all files and figure out the right order of everything.
provider "mongodbatlas" {
  public_key  = local.atlas_pub_key_provided_by_user
  private_key = local.atlas_priv_key_provided_by_user
}

# This informs terraform about our Atlas Org
#  the idea is we create an api key in that org
#  terraform then uses that api key to create a project called 'free-tier-terraformed-project'
#  everythign else, like M0, AWS, EU_WEST_1 should make sense
resource "mongodbatlas_project" "free-atlas-project" {
  org_id = local.atlas_org_id_provided_by_user
  name   = "free-tier-terraformed-project"
}

resource "mongodbatlas_advanced_cluster" "cluster" {
  project_id     = mongodbatlas_project.free-atlas-project.id
  name           = "free-tier-cluster-create-via-terraform"
  cluster_type   = "REPLICASET"
  backup_enabled = false

  replication_specs {
    region_configs {
      electable_specs {
        instance_size = "M0"
      }
      provider_name         = "TENANT"
      backing_provider_name = "AWS"
      region_name           = "EU_WEST_1"
      priority              = 7
    }
  }

  tags {
    key = "created-by"
    value = "https://github.com/karl-denby/mongo-infra-atlas"
  }
}

# Once our cluster is created we need a way to connect to it
#  As we are not in the UI, we are doing things declaritively we ask terraform to tell us
#  what the connection string is once the cluster is created
output "connection_strings" {
  value = mongodbatlas_advanced_cluster.cluster.connection_strings[0].standard_srv
}

resource "mongodbatlas_project_ip_access_list" "ip" {
  project_id = mongodbatlas_project.free-atlas-project.id
  ip_address = local.atlas_pub_ip_of_terraform_machine_calling_atlas_control_plane_with_api_key
  comment    = "created via terraform"
}