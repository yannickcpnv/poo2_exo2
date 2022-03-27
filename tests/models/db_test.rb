require_relative "test"
require "rake"
require "active_record_migrations"

module DbTest
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
