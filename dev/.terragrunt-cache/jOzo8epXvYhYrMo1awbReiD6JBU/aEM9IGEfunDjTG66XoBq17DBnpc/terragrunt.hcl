terraform{
    source = "https://git.rxcorp.com/gkaur2/playground_terragrunt/tree/master/modules"
    }

inputs = {
    TRITON_DATACENTER = "us-east-4"
    MACHINE_COUNT = 1
}