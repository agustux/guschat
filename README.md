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
gem install rails
rails --version
```

How I created the project:
(don't need to run these commands again, just dcoumenting in case I want to upgrade to another rails and start from scratch)
```
rails new guschat
cd guschat
bin/rails generate controller Messages index --skip-routes
bin/rails generate model Message body:text
bin/rails generate migration AddUsernameToMessages username:string
bin/rails db:migrate

subl config/routes.rb
subl app/controllers/messages_controller.rb
subl app/views/messages/index.html.erb
subl app/views/messages/new.html.erb

bin/rails server

```
