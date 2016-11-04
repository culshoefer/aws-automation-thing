from fabric.api import *
import os

env.hosts = ["54.229.146.21"]
env.user = "ubuntu"
env.key_filename = "./scenario.pem"


def deploy():
    run('cd /home/ubuntu/aws-automation-thing && git pull')
    run('cd /home/ubuntu/aws-automation-thing && ./update.sh')
    print('deployed')

