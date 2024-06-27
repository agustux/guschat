# README

installing ruby:
```
# https://github.com/rbenv/ruby-build/wiki#suggested-build-environment
sudo apt-get install autoconf patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
~/.rbenv/bin/rbenv init
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
rbenv install -l
# rbenv install 3.3.3
# rbenv local 3.3.3
cat .ruby-version
ruby --version
```

installing sqlite
```
sudo apt install sqlite3
sqlite3 --version
```

installing rails
```
cd guschat/
bundle install
rails --version
bin/rails db:migrate
```

# How I created the project
Note: don't need to run these commands again, just dcoumenting in case I want to upgrade to another rails and start from scratch
```
rails new guschat
cd guschat
bin/rails generate controller Messages index --skip-routes
bin/rails generate model Message body:text
bin/rails generate migration AddUsernameToMessages username:string
bin/rails generate model User username:string password_digest:string
bin/rails db:migrate

subl config/routes.rb
subl app/controllers/messages_controller.rb
subl app/views/messages/index.html.erb
subl app/views/messages/new.html.erb

bin/rails server

```

# Users management

```
# on laptop:
bin/rails console
# on debian:
sudo -u rails /opt/guschat/bin/rails console

user = User.new(username: "foo")
user.password = 'bar'
user.save

u = User.find_by(username: 'foo')
u.password = 'foobar'
u.save
```

# Creating Self-Signed TLS Certificate
```
# on the debian host

sudo mkdir /etc/nginx/ssl-certs
sudo openssl req -x509 -newkey rsa:4096 \
  -keyout /etc/nginx/ssl-certs/guschat.key \
  -out /etc/nginx/ssl-certs/guschat.crt \
  -sha256 -days 3650 -nodes -subj "/C=US/ST=Texas/L=Paris/O=Gus Tech Inc./OU=Gus/CN=debian"

sudo chmod -R 750 /etc/nginx/ssl-certs
sudo chown -R root:www-data /etc/nginx/ssl-certs

```
