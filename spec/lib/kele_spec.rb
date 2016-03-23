require 'spec_helper'

RSpec.describe Kele do

  context "authorized access" do
    it '#initialize authorizes kele' do
      stub_request(:post, "http://email:password@https//private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions:80/").
      with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
      to_return(:status => 200, :body => "", :headers => {})
    end
  end

  context "unauthorized attempt" do
    it "returns unauthorized status" do
      stub_request(:post, "http://email:password@https//private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions:80/").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => [401, "unauthorized"])

      req = Net::HTTP::Post.new("/")
      Net::HTTP.start("http://email:password@https//private-anon-2a09c6838-blocapi.apiary-mock.com/api/v1/sessions") { |http| http.request(req) }.
        message
      end
    end
  end
