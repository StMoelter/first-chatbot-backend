# Change to match your CPU core count
workers 2

# Min and Max threads per worker
threads 1, 6

# Default to production
rails_env = ENV['RAILS_ENV'] || 'production'
environment rails_env

# Set up socket location
bind 'unix:///chat/tmp/sockets/puma.sock'

# Logging
stdout_redirect '/chat/log/puma.stdout.log', '/chat/log/puma.stderr.log', true

# Set master PID and state locations
pidfile '/chat/tmp/pids/puma.pid'
state_path '/chat/tmp/pids/puma.state'
activate_control_app

on_worker_boot do
  require 'active_record'
  begin
    ActiveRecord::Base.connection.disconnect!
  rescue
    ActiveRecord::ConnectionNotEstablished
  end
  ActiveRecord::Base.establish_connection(YAML.load_file('/chat/config/database.yml')[rails_env])
end
