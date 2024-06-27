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
# test:
ssh gus@192.168.122.18

# run user modifications here as root

# to create a sudoer user with diabled password:
sudo adduser --disabled-password --ingroup sudo gus

# to remove sudo password for that user
echo 'gus ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/gus

apt install sudo -y
```

## calling ansible
```
# make sure you can connect with ssh-key and the user is sudoer
cd ~/guschat/ansible
source .python_venv/bin/activate
.python_venv/bin/ansible-playbook rails-installation.yml -i 192.168.122.207, -u gus
.python_venv/bin/ansible-playbook rails-installation.yml -i 192.168.122.207, -u gus --skip-tags apt
```
