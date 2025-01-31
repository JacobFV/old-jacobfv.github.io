#!/bin/bash

rbenv local 2.7.2
bundle install
# already exists: /home/jacob/.rbenv/versions/2.7.2/lib/ruby/gems/2.7.0/gems/libv8-node-16.10.0.0-x86_64-linux-musl/vendor/v8/x86_64-linux-musl/
# doesn't exist: /home/jacob/.rbenv/versions/2.7.2/lib/ruby/gems/2.7.0/gems/libv8-node-16.10.0.0-x86_64-linux-musl/vendor/v8/x86_64-linux/
ln -s -T /home/jacob/.rbenv/versions/2.7.2/lib/ruby/gems/2.7.0/gems/libv8-node-16.10.0.0-x86_64-linux-musl/vendor/v8/x86_64-linux-musl /home/jacob/.rbenv/versions/2.7.2/lib/ruby/gems/2.7.0/gems/libv8-node-16.10.0.0-x86_64-linux-musl/vendor/v8/x86_64-linux

bundle exec jekyll clean
bundle exec jekyll build

git add .
git commit -m "$1"
git push
