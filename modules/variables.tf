variable "TRITON_DATACENTER" {
  description = "The TRITON datacenter to deploy (eg. us-east-2)"
  type = "string"
}

variable "MACHINE_COUNT" {
  description = "The instance count of the machine to be deployed"
  type = "string"
}

variable "IMAGE_NAME" {
    description = "The instance name you want to create"
    type = "string"

}