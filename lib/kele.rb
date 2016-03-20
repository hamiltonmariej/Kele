class Kele
  include HTTParty
  base_uri 'https://www.bloc.io/api/v1'

  def initialize(email, password)
    @user = {email: email, password: password}
    @uri = 'https://www.bloc.io/api/v1'
    @auth_token = auth_token
  end

  def use_auth_token
    self.class.post {'/sessions/retreive-auth-token', @user}
  end
end
