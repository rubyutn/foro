role :app, %w{deployer@foro.quieroruby.com.ar}
role :web, %w{deployer@foro.quieroruby.com.ar}
role :db,  %w{deployer@foro.quieroruby.com.ar}

server 'foro.quieroruby.com.ar', user: 'deployer', roles: %w{web app}
