
# cap deploy:setup
# cap deploy
# cap db:seed (on first deploy)

$:.unshift(File.expand_path('./lib', ENV['rvm_path']))

require 'bundler/capistrano'

# Uncomment this if you are using Thinking Sphinx
#require 'thinking_sphinx/deploy/capistrano'

# Uncomment this if you are using Whenever
#set :whenever_command, "bundle exec whenever"
#require "whenever/capistrano"

set :application,  '_newera'
set :domain,       '_newera@ramashtab.info'
set :repository,   'git@ramashtab.info:_newera.git'
set :scm,          :git
set :deploy_via,   :remote_cache
set :branch,       :master
set :scm_username, '_victor'
set :scm_verbose,  true
set :user,        '_newera'
set :use_sudo,     false

ssh_options[:forward_agent] = true
default_run_options[:pty]   = false

set :keep_releases,    1
set :deploy_to,        "/home/#{user}/htdocs"

set :unicorn_conf, "#{deploy_to}/current/config/unicorn.rb"
set :unicorn_pid,  "#{deploy_to}/shared/pids/unicorn.pid"


desc "Run tasks in production enviroment."
task :production do
  # Prompt to make really sure we want to deploy into prouction
  puts "\n\e[0;31m   ######################################################################"
  puts "   #\n   #       Are you REALLY sure you want to deploy to production?"
  puts "   #\n   #               Enter y/N + enter to continue\n   #"
  puts "   ######################################################################\e[0m\n"
  proceed = STDIN.gets[0..0] rescue nil
  exit unless proceed == 'y' || proceed == 'Y' 

  # Production nodes
  role :web, domain
  role :app, domain
  role :db,  domain, :primary => true

  set :rails_env, "production"
end

desc "Run tasks in staging enviroment."
task :staging do
  # Staging nodes
  role :web, domain
  role :app, domain
  role :db,  domain, :primary => true

  set :rails_env, "staging"
end

set(:database_username,    "_newera")
set(:production_database)  { application }

namespace :deploy do
  task :restart do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -USR2 `cat #{unicorn_pid}`; else cd #{deploy_to}/current && bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D; fi"
  end

  task :start do
    run "bundle exec unicorn_rails -c #{unicorn_conf} -E #{rails_env} -D"
  end

  task :stop do
    run "if [ -f #{unicorn_pid} ] && [ -e /proc/$(cat #{unicorn_pid}) ]; then kill -QUIT `cat #{unicorn_pid}`; fi"
  end

  desc 'Precache assets'
  task :precache_assets, :roles => :app do
    run "cd #{current_release} && rm -rf #{current_release}/public/assets/* && bundle exec rake assets:precompile RAILS_ENV=#{rails_env}"
  end
end

namespace :db do
  desc "Populates the #{rails_env} database"
  task :seed do
    puts "\n\n=== Populating the #{rails_env} database! ===\n\n"
    run "cd #{current_path} && bundle exec rake db:seed --trace RAILS_ENV=#{rails_env}"
  end

  desc "Create database yaml in shared path"
  task :configure do
    set :database_password do
      Capistrano::CLI.password_prompt "Database Password: "
    end
    
    db_config = <<-EOF
base: &base
  adapter: mysql2
  encoding: utf8
  username: #{database_username}
  password: #{database_password}

production: &production
  database: #{production_database}
  <<: *base

staging: *production
    EOF

    run "mkdir -p #{shared_path}/config"
    put db_config, "#{shared_path}/config/database.yml"
  end

  desc "Make symlink for database yaml"
  task :symlink do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end

# Uncomment this if you are using Thinking Sphinx
#after 'deploy:migrate', :roles => [:app] do
#  thinking_sphinx.stop
#  run "ln -nfs #{shared_path}/db/sphinx #{release_path}/db/sphinx"
#  thinking_sphinx.configure
#  thinking_sphinx.start
#end

before "deploy:setup",   "db:configure"
before "bundle:install", "db:symlink"
after  "bundle:install", "deploy:migrate"
after  "deploy:migrate", "deploy:precache_assets"

require './config/boot'
