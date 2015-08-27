ENV['RACK_ENV'] = 'test'

require 'byebug'
require 'capybara/cucumber'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require 'factory_girl'
require 'rack/test'
require 'rspec/expectations'

require_relative '../../spec/factories'

Capybara.app = Rack::Builder.parse_file(File.expand_path('../../../config.ru', __FILE__)).first

DatabaseCleaner[:sequel, {:connection => Sequel.connect(ENV['DATABASE_URL'])}]
DatabaseCleaner.strategy = :truncation

Around do |scenario, block|
  DatabaseCleaner.cleaning(&block)
end

class CityGramWorld
  include Rack::Test::Methods
  include Capybara::DSL
  include FactoryGirl::Syntax::Methods
end

World { CityGramWorld.new }
