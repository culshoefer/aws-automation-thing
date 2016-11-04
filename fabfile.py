from fabric.api import *
import os

env.hosts = ["54.229.70.158"]
env.user = "ubuntu"
env.key_filename = "./scenario.pem"


def deploy():
    run('cd /home/ubuntu/aws-automation-thing && git pull')
    run('cd /home/ubuntu/aws-automation-thing && ./update.sh')
    print('deployed')
