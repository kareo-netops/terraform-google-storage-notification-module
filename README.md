This module adds support for GCS Notifications. These notifications send messages to pubsubs on certain bucket events. Here's an example of how to configure a GCS notification using an existing bucket and pubsub:
```

locals {
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  env     = local.environment_vars.locals.environment
  project = local.environment_vars.locals.gcp_project
  region  = local.environment_vars.locals.gcp_region
}

dependency "project" {
  config_path = "${get_parent_terragrunt_dir()}/${local.env}/project"
}

terraform {
  source = "git@github.com:kareo-netops/terraform-google-storage-notification-module.git//.?ref=master"
}

include {
  path = find_in_parent_folders()
}

inputs = {
  # required inputs
  bucket_name     = "my-bucket-name"
  payload_format  = "JSON_API_V1"
  topic_id        = "my-topic-name"

  # optional inputs
  event_types       = ["OBJECT_FINALIZE"]
  service_account   = "my-service-account@myaccount.iam.gserviceaccount.com"
  custom_attributes = {
    foo = "bar"
  }
}
```

See the original documentaiton here:
https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_notification.html
