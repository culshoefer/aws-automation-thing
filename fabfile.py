from fabric.api import local, run, env, put
import os, time

# remote ssh credentials
env.hosts = ['10.1.1.25']
env.user = 'deploy'
env.password = 'XXXXXXXX'


def deploy():
	path = '~/aws-automation-thing'
    run('cd %(path)s; git pull' % {'path' : path})
    run('source venv/bin/activate')
    run('cd ref-manager')
    run('python manage.py makemigrations')
    run('python manage.py migrate')
    run('python manage collect_static')
    sudo('stystemclt restart nginx')
	print('deploy complete!')
