# README

# Ansible

## setting up my laptop
```
python3 -m venv .python_venv
source .python_venv/bin/activate
python -m pip install --upgrade pip
python -m pip install ansible-core
```

## Bootstrap for Debian:
```
apt-get update
apt-get upgrade -y
# apt install python3.11-venv -y
# apt install sudo git -y
# python3 -m venv ansible_venv
# ./ansible_venv/bin/python3 -m pip install --upgrade pip
# ./ansible_venv/bin/python3 -m pip install ansible-core
# git clone https://github.com/agustux/guschat.git
# ANSIBLE_CONFIG=guschat/ansible/ansible.cfg ./ansible_venv/bin/ansible-playbook guschat/ansible/rails-installation.yml

# only if the user was not created during debian installation:
adduser --ingroup sudo gus # (gus123)

# if the user was created during debian installation:
sudo usermod -aG sudo gus

echo 'gus ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/gus

mkdir /home/gus/.ssh
nano /home/gus/.ssh/authorized_keys
# test:
ssh gus@192.168.122.18
```

## calling ansible
```
# make sure you can connect with ssh-key and the user is sudoer
cd ~/guschat/ansible
source .python_venv/bin/activate
.python_venv/bin/ansible-playbook rails-installation.yml -i 192.168.122.18, -u gus

```