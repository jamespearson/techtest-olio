require 'rails_helper'
require Rails.root.join("spec/concerns/remote_id.rb")
require Rails.root.join("spec/concerns/image_url.rb")

RSpec.describe Post, type: :model do
  
  it_behaves_like "has_image_url"
  it_behaves_like "has_remote_id"

  it "should require a description" do
    should validate_presence_of(:description)
  end

  it "should require an expiry date" do
    should validate_presence_of(:expires_at)
  end

  it "should require a title" do
    should validate_presence_of(:title)
  end

  it "should belong to a user" do
    should belong_to(:user)
  end

  it "should require a user" do
    should validate_presence_of(:user)
  end

end
