require "kele/errors"
require 'httparty'
require 'json'

class Kele
  include HTTParty
  base_uri "https://www.bloc.io/api/v1/"

  def initialize(email, password)
    response = self.class.post(api_url("sessions"), body: {"email": email, "password": password})
    raise InvalidStudentCodeError.new() if response.code == 401
    @auth_token = response["auth_token"]
  end

  def get_me
    response = self.class.get(api_url("users/me"), headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
  end
  #when I run this below I get message: resource not found; it is this way on api console as well
  def get_mentor_availability(mentor_id)
    response = self.class.get(api_url("mentors/#{mentor_id}/student_availability"), headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
  end

  private
  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
