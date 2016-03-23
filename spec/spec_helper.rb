$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler/setup'
Bundler.setup
require 'kele'
require 'rspec'
require 'webmock/rspec'
require 'json'

WebMock.disable_net_connect!(allow_localhost: true)
# WebMock.allow_net_connect!(:net_http_connect_on_start => true)


  RSpec.configure do |config|
  end
