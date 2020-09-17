describe docker.containers do
  its('ports') { should include '0.0.0.0:5000->5000/tcp' }
end

describe docker_container(name: 'registry') do
  its('tag') { should eq 'latest' }
  it { should be_running }
end

describe file('/etc/docker/registry/config.yml') do 
	it{should exist}
end

describe docker.version do
  its('Server.Version') { should cmp >= "19.03"}
end

describe docker.object("c24a42790352") do
  its('ResolvConfPath') { should match '/var/lib/docker/containers/*'}
end

================= single describe===========
describe docker_container('container') do
  it { should exist }
  it { should be_running }
  its('id') { should_not eq '' }
  its('image') { should eq 'registry:latest' }
  its('repo') { should eq 'registry' }
  its('tag') { should eq 'latest' }
  its('ports') { should include '0.0.0.0:5000->5000/tcp' }
end

# docker pull hello-world
# docker tag hello-world localhost:5000/hello-world:latest
# docker images
# docker push localhost:5000/hello-world:latest
# docker images
# curl -X GET http://localhost:5000/v2/_catalog
