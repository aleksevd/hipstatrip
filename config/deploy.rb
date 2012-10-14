require "bundler/capistrano"
load "deploy/assets"

set :application, "hipsta_trip"
set :repository,  "git@github.com:railsrumble/r12-team-558.git"

set :scm, :git
set :user, "hipster"
set :use_sudo, false
set :branch, "master"
set :keep_releases, 15
set :deploy_via, :remote_cache

set :ssh_options, forward_agent: true
set :default_run_options, pty: true

server "binarycode.r12.railsrumble.com", :web, :app, :db, primary: true

set :deploy_to, "/home/hipster/hipsta_trip"

namespace :deploy do
  task :start, except: { no_release: true } do
    run "cd #{current_path} ; bundle exec unicorn_rails -c config/unicorn.rb -D"
  end

  task :stop, except: { no_release: true } do
    run "kill -s QUIT `cat /tmp/unicorn.hipsta_trip.pid`"
  end

  task :restart, except: { no_release: true } do
    run "kill -s USR2 `cat /tmp/unicorn.hipsta_trip.pid`"
  end

  task :link_database_config do
    run "ln -sF #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

=begin
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
=end
end

after "deploy:finalize_update", "deploy:link_database_config"
after "deploy", "deploy:cleanup"
after "deploy:update_code", "deploy:migrate"
