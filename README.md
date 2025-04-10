# README

Requirements:

* Ruby version: 3.2.2
* postgresql

Local Setup:

brew install rbenv
rbenv install 3.2.2
rbenv global 3.2.2
bundle install

brew install postgresql@17

rails db:create db:migrate
