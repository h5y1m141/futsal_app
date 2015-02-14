# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'


Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Base.logger = Logger.new(Rails.root.join('log/spec.log')) if defined?(ActiveRecord::Base)
RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = :random
end
