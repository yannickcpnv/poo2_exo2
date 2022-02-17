require 'active_record'

ActiveRecord::Base.establish_connection(YAML.load_file('db/config.yml')['development'])

# Setup logger (so that we may inspect the generated SQL)
require 'logger'
ActiveRecord::Base.logger = Logger.new("log/ar.log")
