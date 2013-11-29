# be sure to change thse
set :user,        'shirokuro11'
set :domain,      'depot.praggrog.com'
set :application, 'depot'

# adjust if you are using RVM, remove if you are not
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
# require "rvm/capistrano"
# set :rvm_ruby_string, '1.9.2'
# set :rvm_type, :user

# file paths
set :repository,  "git@github.com:shirokuro0418/depot.git"
set :deploy_to,  "/user/#{user}/#{domain}"

role :web, domain                          # Your HTTP server, Apache/etc
role :app, domain                          # This may be the same as your `Web` server
role :db,  domain, :primary => true        # This is where Rails migrations will run

# you might need to set this if your aren't seeing password prompts
# default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the follwing might be needed
# if (for example) you have locally installed gems or applications.
# Note: this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GET_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'

# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, :production

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end
