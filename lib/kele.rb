require "kele/errors"
require 'httparty'
require 'json'
require 'kele/roadmap'

class Kele
  include HTTParty
  include Roadmap

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

  def get_messages(arg = nil)
    response = self.class.get(api_url("message_threads"), headers: { "authorization" => @auth_token })
    body = JSON.parse(response.body)
    pages = (1..(response["count"]/10 + 1)).map do |n|
      self.class.get(api_url("message_threads"), body: { page: n }, headers: { "authorization" => @auth_token })
    end
  end

  def create_message(user_id, recipient_id, token, subject, stripped)
    options = {body: {user_id: user_id, recipient_id: recipient_id, token: nil, subject: subject, stripped: stripped}, headers: { "authorization" => @auth_token }}
    self.class.post(api_url("messages"), options)
  end

  def create_submission(assignment_branch, assignment_commit_link, checkpoint_id, comment, enrollment_id)
    options = {body: {assignment_branch: assignment_branch, assignment_commit_link: assignment_commit_link, checkpoint_id: checkpoint_id, comment: comment, enrollment_id: enrollment_id}, headers: { "authorization" => @auth_token }}
    self.class.post(api_url("checkpoint_submissions"), options)
  end

  private
  def api_url(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end
end
