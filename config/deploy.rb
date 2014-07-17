require 'bundler/capistrano'

set :rails_env, 'production'

set :app_server, :passenger

set :user, 'annadmin'
set :domain, '10.11.5.11'
set :application, 'discretionary.annkissamprojects.com'
set :repository,  'git@github.com:annkissam/discretionary_funding.git'

set :scm, 'git'
set :branch, 'master'

set :use_sudo, false
set :deploy_to, "/usr/local/apache2/www/rails_apps/#{application}"

#Faster Deploy - https://help.github.com/articles/deploying-with-capistrano
set :deploy_via, :remote_cache

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true        # This is where Rails migrations will run

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end

set :keep_releases, 3
