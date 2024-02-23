ami                         = "ami-02ea01341a2884771"   
AWS_REGION                  = "eu-west-3"
department                  = ["engineering", "marketing", "finance"]
engineering_subnets         = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24", "10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
marketing_subnets           = ["172.16.1.0/24", "172.16.2.0/24", "172.16.3.0/24", "172.16.4.0/24", "172.16.5.0/24"]
finance_subnets             = ["10.100.0.0/24", "10.100.1.0/24", "10.100.2.0/24", "10.100.3.0/24", "10.100.4.0/24", "10.100.5.0/24"]
instance_type               = "t2.micro"
key_name                    = "devops_training_key"
no_of_instances             = [0,1,2,3,4,5,6,7,8,9]
#openvpn_ami                 = "ami-07bf5da57dc62b064"
PATH_TO_PUBLIC_KEY          = "devops_training_key.pub"
PATH_TO_PRIVATE_KEY         = "devops_training_key"
# private_instance_names      = ["default vpc private_instance_1", "custom vpc private_instance_2", "private_instance_3", "private_instance_4"]
# public_instance_names       = ["default vpc public_instance_1", "custom vpc public_instance_2", "public_instance_3", "public_instance_4"]
SSH_PORT                    = 22
trustedIPs                  = ["196.251.243.156/30", "143.110.236.153/32", "10.0.0.0/16", "172.31.0.0/16"]

vpc_cidr                    = {
    engineering             = "10.0.0.0/16"
    marketing               = "172.16.0.0/16"
    finance                 = "10.100.0.0/16"
}
