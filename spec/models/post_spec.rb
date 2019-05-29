require 'rails_helper'
require Rails.root.join("spec/concerns/remote_id.rb")

RSpec.describe Post, type: :model do
  
  it_behaves_like "has_remote_id"
  
  it "should require a description" do
    should validate_presence_of(:description)
  end

  it "should require an expiry date" do
    should validate_presence_of(:expires_at)
  end

  context "it's image url" do

    it "should be required" do
      should validate_presence_of(:image_url)
    end

    it "should accept a valid url" do
      should allow_value('http://foo.com').for(:image_url)
    end

    it "should not accept an invalid url" do
      should_not allow_value('ftp://foo.com').for(:image_url)
    end

  end


  it "should require a title" do
    should validate_presence_of(:title)
  end

end
