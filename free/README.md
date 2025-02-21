# Setup an M0/Free-Tier in a new project

## Preparation

### You

- This is a short educational demo
- It shows one way of working with terrafrom
- It will let you deploy a cluster, then add and IP and user that can access that cluster
- It will also let you modify/remove the cluster easily
- Once your familiar with this we can move on to more complex things

### On Atlas

1. Go to your Atlas Organization
1. Go to the Access Manager and create an API Key
1. Add the IP from which you will run the terraform commands to the access list

### On this machine

1. If its your first time in this folder, run `terraform init` which will download the provider
1. Add your API/KEY and IP to `variables.tf`
1. Run `terraform plan`
1. Run `terraform apply`
1. Answer `yes`
1. It can take a few minutes, in this case it was 5

```console
mongodbatlas_advanced_cluster.cluster: Still creating... [5m0s elapsed]
mongodbatlas_advanced_cluster.cluster: Still creating... [5m10s elapsed]
mongodbatlas_advanced_cluster.cluster: Creation complete after 5m14s [id=Y2x1c3Rlcl9pZA==:NjdiODc2ZDg1ODQ0OGQxOGRkYzk0M2Q0-Y2x1c3Rlcl9uYW1l:ZnJlZS10aWVyLWNsdXN0ZXItY3JlYXRlLXZpYS10ZXJyYWZvcm0=-cHJvamVjdF9pZA==:NjdiODc2ZDE5MGRhMDg3NmMwMjhjMjdm]

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

Outputs:

connection_strings = "mongodb+srv://free-tier-cluster-creat.qc893.mongodb.net"
```

### Additional items (IP Access and a Database User)

1. copy the IP settings `cp additional/ip.tf ip.tf`
1. check your current IP `curl http://ipinfo.io/ip`
1. Update `variables.tf` with this IP and **save it**
1. run `terraform plan` and you should see the planned modification
1. run `terraform apply` and terraform will figure out how to make it happen answer `yes`
1. copy the user/password setting `cp additional/user.tf user.tf`
1. update the password you want in `user.tf` and **save it**
1. run `terraform plan` and you should see the planned modification
1. run `terraform apply` and terraform will figure out how to make it happen answer `yes`
1. You should now be able to connect with **Compass** or `mongosh` as user "terraformed-user" with the password you set
1. Feel free to modify anything you want and apply it

### Clean up when you are finished

1. Run `terraform destroy` from this folder
