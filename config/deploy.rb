set :application, "mm"
set :deploy_to, "/var/rails/#{application}"
set :keep_releases, 3

set :scm, :git
set :repository,  "git@github.com:railsdevmatt/mm.git"
set :git_shallow_clone, 1
set :branch, "master"
set :use_sudo, true

set :user, "deploy"
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

role :app, "ec2-174-129-167-120.compute-1.amazonaws.com"
role :web, "ec2-174-129-167-120.compute-1.amazonaws.com"
role :db,  "ec2-174-129-167-120.compute-1.amazonaws.com", :primary => true

task :staging do
  set :application, "mm"
  set :rails_env, "staging"
  set :deploy_to, "/var/rails/#{application}"
  server "ec2-174-129-167-120.compute-1.amazonaws.com", :app, :web, :db, :primary => true
end

after 'deploy:update_code', 'deploy:symlink_db'
before "deploy:restart", "deploy:bundle"

namespace :deploy do
  
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{deploy_to}/shared/config/database.yml #{release_path}/config/database.yml"
  end
  
  desc "run bundle install and ensure all gem requirements are met"
  task :bundle do
    run "cd #{current_path} && bundle install  --without=test"
  end
  
  desc "Zero-downtime restart of Unicorn"
  task :restart, :except => { :no_release => true } do
    run "cd #{current_path} && kill -s USR2 `cat tmp/pids/unicorn.pid`"
  end
  # 
  # desc "Start unicorn"
  # task :start, :except => { :no_release => true } do
  #   run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
  # end
  # 
  # desc "Stop unicorn"
  # task :stop, :except => { :no_release => true } do
  #   run "kill -s QUIT `cat tmp/pids/unicorn.pid`"
  # end
  
end

# require 'capistrano-unicorn'
