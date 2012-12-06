require "bundler/capistrano"
# set :stages,        %w(production dev)
# set :default_stage, "production"
# require "capistrano/ext/multistage"

set :application,   "captest"
set :repository,    "git://github.com/grahamb/captest.git"
set :scm,           :git
set :user,          "canvasuser"
set :branch,        "deploy"
set :deploy_via,    :remote_cache
set :deploy_to,     "/tmp/captest"
set :use_sudo,      false
set :deploy_env,    "test"
ssh_options[:forward_agent] = true
ssh_options[:keys] = [File.join(ENV["HOME"], ".ssh", "id_rsa_canvas")]

role :app, "canvas-at1.tier2.sfu.ca", "canvas-at2.tier2.sfu.ca", "canvas-at3.tier2.sfu.ca"
role :db,  "canvas-mt.tier2.sfu.ca"

task :wtf, :roles => [:db] do
  run "cat /home/canvasuser/hello"
end


# set :application, "set your application name here"
# set :repository,  "set your repository location here"

# # set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# # Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

# role :web, "canvas-mt.tier2.sfu.ca"                          # Your HTTP server, Apache/etc
# # role :app, "your app-server here"                          # This may be the same as your `Web` server
# # role :db,  "your primary db-server here", :primary => true # This is where Rails migrations will run
# # role :db,  "your slave db-server here"

# # if you want to clean up old releases on each deploy uncomment this:
# # after "deploy:restart", "deploy:cleanup"

# # if you're still using the script/reaper helper you will need
# # these http://github.com/rails/irs_process_scripts

# # If you are using Passenger mod_rails uncomment this:
# # namespace :deploy do
# #   task :start do ; end
# #   task :stop do ; end
# #   task :restart, :roles => :app, :except => { :no_release => true } do
# #     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
# #   end
# # end