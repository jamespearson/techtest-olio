require 'spec_helper'

shared_examples_for "has_image_url" do

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
