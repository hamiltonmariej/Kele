$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler/setup'
Bundler.setup
require 'kele'
require 'webmock/rspec'
require 'json'
require "test/spec/lib"

  RSpec.configure do |config|
    config.before(:each) do
      allow(Kele).to receive(:any).and_return('stubbed')
    end
  end
end
