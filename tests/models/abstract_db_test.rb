require_relative "test"
require "rake"
require "active_record_migrations"

class AbstractDbTest < Minitest::Test
  def setup
    Rake.application.init
    Rake.application.load_rakefile

    task = Rake::Task['db:seed:replant']
    task.reenable
    task.invoke
  end

  def teardown
    Rake::Task.clear
  end
end
