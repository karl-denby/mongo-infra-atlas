# mongo-infra-atlas

A few useful ways to setup and use Atlas programatically

## Goals

### Simple setup

1. Run a script or update a file to gather info about any keys/secrets we need
1. Changing to a folder (`cd`) then running whatever assets are in there like `.tf`

### Batteries included

1. Would be nice to have everything possible free tiers
1. Would be nice if we can deploy a client in AWS
1. Would be nice if we can setup VPCs and private links between Atlas and AWS
1. Would be nice if we can deploy LDAP/OIDC in AWS for use with Atlas

### Leave things as you found them

1. A script to undo as much of this as possible
1. Maybe some self documentation of the resulting environment?

## Features

| Feature | Status |
|---------|--------|
| Free Tier (M0) | Done |
| Shared/Flex (M2/5) | Not Done |
| Dedicated (M10+) | Not Done |
| EC2 Client | Not Done |
| LDAP on EC2 | Not Done |
| OIDC on EC2 | Not Done |
| Documentation | Not Done |

## Changelog

- 2025-02-20 Initial Setup
