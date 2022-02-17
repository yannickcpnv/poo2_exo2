require 'active_record_migrations'
ActiveRecordMigrations.load_tasks

# Simple hack to prevent the error below when using `references` type on db:new_migration
#   NoMethodError: undefined method `active_record' for #<Rails::Application::Configuration:0x00007fa3cbbe7870>
Rails.configuration.active_record = ActiveRecord::Base
