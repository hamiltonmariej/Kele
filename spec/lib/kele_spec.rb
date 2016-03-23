require 'spec_helper'

RSpec.describe Kele do

  context "authorized access" do
    it '#initialize authorizes kele' do
      stub_request(:post, "http://email:password@https//private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions:80/").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
    end

    # Net::HTTP.start('https://private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions') do |http|
    #   req = Net::HTTP::Post.new('/')
    #   req.basic_auth 'email', 'password'
    #   http.request(req)
    # end
  end

  it "returns unauthorized status" do
    let(:uri) { 'email:password@https://private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions' }
    stub_request(:post, uri).
      Net::HTTP.start(uri) do |http|
        req = Net::HTTP::Post.new('/')
        req.basic_auth 'email', 'password'
        http.request(req).
        to_return(:status => 401, :body => '401.json', :headers => {})
      end
    end
  end
end
