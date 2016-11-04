from fabric.api import *
import os

env.hosts = ["54.229.70.158"]
env.user = "ubuntu"
env.key_filename = "./scenario.pem"


def deploy():
    run('cd ~/aws-automation-thing && git pull')
    run('cd ~/aws-automation-thing && update.sh')
    print('deployed')
