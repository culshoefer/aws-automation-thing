#!/bin/bash
keyLocation=~/.ssh/perspem.pem
name=test


ssh -i $keyLocation  ubuntu@$name -o StrictHostKeyChecking=no
./setup-all.sh
