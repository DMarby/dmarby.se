# dmarby.se
This repo contains my personal website, as well as the configuration for setting up the infrastructure to run it.

## Usage
After cloning this repository, make sure that you've checked out the submodules recursively (so that each submodule has their submodules checked out as well).

To get started, you'll need to create the following on DigitalOcean:
- A private DigitalOcean Space for Terraform remote state
- A private DigitalOcean Space for Yokuso/Klein
- An API key for Terraform to access DigitalOcean
- A DigitalOcean Spaces access key for Yokuso/Klein to access DigitalOcean Spaces.

Then, copy the following files, and replace the default values with your credentials:
```
terraform/terraform.tfvars.example -> terraform/terraform.tfvars
terraform/terraform.tf.example -> terraform/terraform.tf
.env.example -> .env
```

You can now set up the infrastructure by going to the `terraform` directory, and running `terraform apply`.

To deploy the docker containers, run `./deploy` in the main directory of this repository.
