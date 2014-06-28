set :application, 'foro'
set :repo_url, 'https://github.com/rubyutn/foro.git'

set :deploy_to, '/var/www/foro'

set :log_level, :info
set :linked_dirs, %w{log}
set :keep_releases, 5

set :rbenv_ruby, '2.1.2'

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute 'service unicorn_foro upgrade'
    end
  end

  after :publishing, :restart
end
