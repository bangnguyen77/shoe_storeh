ENV['RACK_ENV'] = 'test'

require('bundler/setup')
# require("zlib")
Bundler.require(:default, :test)
set(:root, Dir.pwd())

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }
