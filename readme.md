# jenkins-capistrano
Vagrant box with puppet to configure a box with the jenkins setup I
typically use for CI with cap based deployments.

## Running It
This uses RVM, which sadly requires to be provisioned twice for it to
work. There's a script called runit.sh in the root dir that will call
``vagrant up && vagrant provision`` so that the provisioner runs twice. 
