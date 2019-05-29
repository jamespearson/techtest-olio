require 'rails_helper'

RSpec.describe Post, type: :model do
  
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

  context "it's remote id" do

    it("should be required") do
      should validate_presence_of(:remote_id)
    end

    it("should be unique") do
      should validate_uniqueness_of(:remote_id)
    end

  end

  it "should require a title" do
    should validate_presence_of(:title)
  end

end
