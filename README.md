# README

```
ruby --version
sqlite3 --version

gem install rails
rails --version

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