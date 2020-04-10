provider "triton" {
  account = "spokedev_dev"
  key_id  = "f9:4c:71:40:5a:9a:5a:56:68:e5:98:41:b0:81:47:8f"
  url = "https://${var.TRITON_DATACENTER}-cloudapi.bdf-cloud.iqvia.net"
  user = "gkaur"
}

data "triton_image" "base" {
  name = "var.IMAGE_NAME"
  version = "1.0-SNAPSHOT"

}

data "triton_network" "public" {
  name = "sdc_nat"
}

resource "triton_machine" "PNX" {
    count = var.MACHINE_COUNT
    name = "PNX_centos7-7_jdk8-${count.index+1}"
    package = "vm-1cpu-4m-100d-gpc"
    image    = "${data.triton_image.base.id}"
    networks = ["${data.triton_network.public.id}"]
    firewall_enabled     = true
    root_authorized_keys = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC6BbcEqVT4iDzg7rb3R4p8yLTg4FCqCOVgMfl84AcUSrX3BWepujen1LcA/aegImk5n4awxsEeDvoI2h4SYF0McERrU5MFn+kAABv2ops4bO8oySM9M9FQqDF3MxAmaSAMxFAwhVvTbgLz/ME7VZcn7WhB3ZNjDUSK/CYYErP8IAYswnkBpFqtJ4DctOuAnzw07WqDN0qX7p9PyHf3S8BVn0524DI8mAyvmlnw/dXPhbJKjnQTBZAedVvpGdfo+yxrvu70651X/aw/g1y/OFA7z9aKvULuxO7zZ4rOc442l/KRtQUTgMxuHyiD432F3P2YPiAHBOelqN9fl6dDkuFM2MvlxJbeF8sjaSZflUfbdAQEXnkIrCvouo1qPub8Mtu6RdqMqtVr0n9AiJ3dhL4AP4YpZgiKH2l7NftOTfuq9zaU14V2nl9vso3dTXclxsmRIJzEnf64U2+o2RAq0J9pl4dhKXe/898M91UZFaFi7GxoUKXVo4mFcGt6vaan5qhp+ySbA8cEexZYEirRKgybyr95VHT8Oxh7KLYOejPzI2G/mdLuWkCc57nLdLWpRx7jLc72AxfQBBAXkHGCciQEA/LQk+kMwsLD6NDP5KDLkYx0DFvzl2HEa3Vq3QEB+VK+/oZ2qxeJGvenWcpZT2Bvkds/q9s+UHPi+aYEJ7YkYQ== wl1044880@PL2WMY15733"
    tags = {
       test = "testing"
    }
}

