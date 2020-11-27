describe aws_auto_scaling_group("#{input('workspace')}-Demo-ASG") do
  it                      { should exist }
  its('min_size')         { should be 1}
  its('desired_capacity') { should be 1 }
  its('max_size')         { should be 1}
end
