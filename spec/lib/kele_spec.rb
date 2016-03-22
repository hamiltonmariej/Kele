require 'spec_helper'

RSpec.describe Kele do
  before do
    Webmock.stub_request(:post, "email:password@https://private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions")
    .with(:headers => {'Content-Type:'=> 'application/json' }, :body => {"email": email, "password": password}, )
    .to_return(:status => 200, :body => {}, :headers => {})
  end

  describe '#initialize' do
    it 'authenticates user' do
      response = Kele.new(:host => 'https://private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions' )
      expect(response.instance_variable_get(:@auth_token)).to be_a String
    end

    it 'raises error' do
      page.driver.get uri
      expect { Kele.new(body: {"fakeemail": email, "fakepassword": password})} .to raise_error(InvalidStudentCodeError)
    end
  end
end

# context "authorized access" do
#   Net::HTTP.start('https://private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions') do |http|
#     req = Net::HTTP::Post.new('/')
#     req.basic_auth 'email', 'password'
#     http.request(req)
#   end
# end

# context "with unauthorized access" do
#   let(:uri) { 'https://private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions' }
#   before { stub_request(:get, uri).to_return(status: 401, body: fixture('401.json')) }
#   it "gets a not authorized notification" do
#     page.driver.get uri
#     expect(page).to have_content 'Access denied'
#   end
# end
