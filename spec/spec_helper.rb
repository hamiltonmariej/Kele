$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler/setup'
Bundler.setup
require 'kele'
require 'rspec'
require 'webmock/rspec'
require 'json'

WebMock.disable_net_connect!(allow_localhost: true)

  # RSpec.configure do |config|
  #   config.before :each do
  #     stub_request(:post, "email:password@",api_url("sessions")).
  #       with(headers: {}).
  #       to_return(status: 200, body: "", headers: {})
  #     end
  #   end
  #
  # private
  # def api_url(endpoint)
  #   "https://private-4967b7-blocapi.apiary-mock.com/api/v1/#{endpoint}"
  # end
