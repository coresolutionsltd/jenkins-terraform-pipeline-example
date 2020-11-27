# load data from Terraform output
content = inspec.profile.file("output.json")
params = JSON.parse(content)

# store vpc in variable VPC_ID
VPC_ID = params['vpc_id']['value']

describe aws_security_group(group_name: "#{input('workspace')}-Instance-SG") do
  it                         { should exist }
  its('group_name')          { should eq "#{input('workspace')}-Instance-SG" }
  its('inbound_rules_count') { should eq 2 }
  it                         { should allow_in(port: 443) }
  it                         { should allow_in(port: 80) }
  its('vpc_id')              { should eq VPC_ID }
end
