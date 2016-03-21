dir = File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require File.join(dir, 'httparty')

class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    @auth = {email: email, password: password}
    @auth_token = auth_token
  end

  def get_auth_token(options = {})
    options.merge!({basic_auth: @auth})
    self.class.post('/sessions', options)
  end
end

kele = Kele.new(config['email'], config['password'])
puts kele.auth_token
