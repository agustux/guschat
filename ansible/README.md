# README

# Ansible

## setting up my laptop
```
cd ~/guschat/ansible
python3 -m venv .python_venv
source .python_venv/bin/activate
python -m pip install --upgrade pip
python -m pip install ansible-core
```

## Bootstrap for Debian:
```
apt-get update
apt-get upgrade -y

mkdir /home/gus/.ssh
nano /home/gus/.ssh/authorized_keys
cp /home/gus/.ssh/authorized_keys /root/.ssh/
# test:
ssh gus@192.168.122.18
```

## calling ansible
```
# make sure you can connect with ssh-key and the user is sudoer
cd ~/guschat/ansible
source .python_venv/bin/activate
.python_venv/bin/ansible-playbook rails-installation.yml -i root@192.168.122.207,
.python_venv/bin/ansible-playbook rails-installation.yml -i root@192.168.122.207, --skip-tags apt
```
