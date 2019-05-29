require 'rails_helper'

RSpec.describe PostsImportJob, type: :job do
  
  context "when the data is valid" do

    before(:each) do
      valid_data = open(Rails.root.join('spec', 'fixtures', 'test-articles', 'valid.json'))
      stub_request(:get, "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles.json").
      to_return(status: 200, body: valid_data, headers: {})
    end

    it("should create 11 users") do
      expect{
        PostsImportJob.perform_now
      }.to change{User.count}.from(0).to(11)
    end


    it("should create 20 posts") do
      expect{
        PostsImportJob.perform_now
      }.to change{Post.count}.from(0).to(20)
    end

  end
  
  context "when the data is invalid" do

    before(:each) do
      invalid_data = open(Rails.root.join('spec', 'fixtures', 'test-articles', 'invalid.json'))
      stub_request(:get, "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles.json").
      to_return(status: 200, body: invalid_data, headers: {})
    end

    it("should not create users") do
      expect{
        PostsImportJob.perform_now
      }.to_not change{User.count}.from(0)
    end

    it("should not create posts") do
      expect{
        PostsImportJob.perform_now
      }.to_not change{Post.count}.from(0)
    end
  end

  context "when the data is missing (40X)" do

    before(:each) do
      stub_request(:get, "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles.json").
      to_return(status: 404, body: nil, headers: {})
    end

    it "should not error" do
      expect(PostsImportJob.perform_now).to be(nil)
    end
  end

  context "when the data is remotly broken (50X)" do

    before(:each) do
      stub_request(:get, "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles.json").
      to_return(status: 5005, body: nil, headers: {})
    end

    it "should not error" do
      expect(PostsImportJob.perform_now).to be(nil)
    end
  end

end
