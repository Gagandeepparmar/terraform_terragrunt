terraform{
    source = "git::https://git.rxcorp.com/gkaur2/modules.git//"
    }

inputs = {
    TRITON_DATACENTER = "us-east-3"
    MACHINE_COUNT = 2
    IMAGE_NAME = "usx-sampleservice"
}