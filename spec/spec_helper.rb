ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
Bundler.require(:default, :test)
set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

RSpec.configure do |config|
  config.after(:each) do
    Store.all.each do |store|
      store.destroy
    end
    Brand.all.each do |brand|
      brand.destroy
    end
  end
end
