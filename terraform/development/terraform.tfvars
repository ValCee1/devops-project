ALL_IPs    = "0.0.0.0/0"
ami        = "ami-02ea01341a2884771"
AWS_REGION = "eu-west-3"

engineering_subnets = {
  private = "10.0.101.0/24"
  public  = "10.0.1.0/24"
}
marketing_subnets = {
  private = "10.0.102.0/24"
  public  = "10.0.2.0/24"
}
finance_subnets = {
  private = "10.0.103.0/24"
  public  = "10.0.3.0/24"
}
instance_type       = "t2.micro"
key_name            = "department"
openvpn_ami         = "ami-07bf5da57dc62b064"
PATH_TO_PUBLIC_KEY  = "devops_training_key.pub"
PATH_TO_PRIVATE_KEY = "devops_training_key"
SSH_PORT            = 22
trustedIPs          = ["196.251.243.156/30", "143.110.236.153/32"]

vpc_cidr = "10.0.0.0/16"
