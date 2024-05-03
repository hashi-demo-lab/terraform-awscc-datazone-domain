## Variables file

variable "aws_account" {
  type        = string
  description = "AWS Account ID"
  default     = "855831148133"
}
variable "datazone_domain_name" {
  description = "The name of the aws datazone domain"
  type        = string
}

variable "datazone_description" {
  description = "The description of the aws datazone domain"
  type        = string
  default     = "AWS DataZone Domain"
}

variable "datazone_kms_key_identifier" {
  description = "The KMS key identifier to use for encryption"
  type        = string
  default     = null
}

variable "single_sign_on" {
  description = "The single sign on configuration"
  type = map(object({
    type            = optional(string)
    user_assignment = optional(string)
  }))
  default  = {}
  nullable = false
}

variable "tags" {
  description = "The tags to apply to the domain"
  type = set(object({
    key   = string
    value = string
  }))
  default = null
}

variable "region" {
  description = "The region to deploy the domain"
  type        = string
  default     = "ap-southeast-2"
}

# Environment Blueprints - today only DefaultDataWarehouse, DefaultDataLake
variable "environment_blueprints" {
  description = "The environment blueprints to deploy"
  type = map(object({
    enabled_regions                  = list(string)
    environment_blueprint_identifier = string
    provisioning_role_arn            = optional(string)
    manage_access_role_arn           = optional(string)
  }))

  default = {
    DefaultDataWarehouse = {
      enabled_regions                  = ["ap-southeast-2"]
      environment_blueprint_identifier = "DefaultDataWarehouse"
    }
    DefaultDataLake = {
      enabled_regions                  = ["ap-southeast-2"]
      environment_blueprint_identifier = "DefaultDataLake"
    }
  }
}


variable "datazone_projects" {
  description = "The projects to deploy"
  type = map(object({
    description    = optional(string)
    glossary_terms = optional(list(string))
  }))
  default = {
    "environment" = {
      description    = "shared environment project"
      glossary_terms = ["term1", "term2"]
    }
    "data_team" = {
      description    = "Data Team Project 1"
      glossary_terms = ["term3", "term4"]
    }
  }
}
# moved to terraform-aws-datazone-environments
/* variable "datazone_environment_profiles" {
  description = "The environment profiles to deploy"
  type = map(object({
    aws_account_id                   = string
    name                             = string
    description                      = optional(string)
    region                           = string
    environment_blueprint_identifier = string
    project_name                     = string
    user_parameters = optional(list(object({
      name  = string
      value = string
    })))

  }))
  default = {

    "DefaultDataWarehouse" = {
      aws_account_id                   = "855831148133"
      name                             = "DefaultDataWarehouse_profile"
      region                           = "ap-southeast-2"
      environment_blueprint_identifier = "DefaultDataWarehouse"
      project_name                     = "environment"
      user_parameters                  = []
    }
    "DefaultDataLake" = {
      aws_account_id                   = "855831148133"
      name                             = "DefaultDataLake_profile"
      region                           = "ap-southeast-2"
      environment_blueprint_identifier = "DefaultDataLake"
      project_name                     = "environment"
    }
  }
} */

# moved to terraform-aws-datazone-environments
/* variable "datazone_environments" {
  description = "The environments to deploy"
  type = map(object({
    name                           = string
    environment_profile_identifier = string
    project_target                 = string
  }))
  default = {
    "Raw" = {
      name                           = "Raw Data Lake"
      environment_profile_identifier = "DefaultDataLake"
      project_target                 = "data_team"
    }
    "Curated" = {
      name                           = "Curated Data Lake"
      environment_profile_identifier = "DefaultDataLake"
      project_target                 = "data_team"
    }
    "Product" = {
      name                           = "Product Data Lake"
      environment_profile_identifier = "DefaultDataLake"
      project_target                 = "data_team"
    }
  }
} */