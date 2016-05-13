ENV['RACK_ENV'] ||= "test"
#env is variable across the environment. This should be at the top.

require File.expand_path("../../config/environment", __FILE__)
require 'minitest/autorun'
require 'minitest/pride'
require 'tilt/erb'
require 'capybara/dsl'


module TestHelpers
  def teardown
    task_manager.delete_all
    super
      #if your superclass includes, this, inherit from it (to use our method instead of built-in method)
  end

  def task_manager
    # database = YAML::Store.new('db/task_manager_test')
    database = Sequel.postgres('task_manager_test')
    @task_manager ||= TaskManager.new(database)
  end
end

Capybara.app = TaskManagerApp

class FeatureTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers
end
