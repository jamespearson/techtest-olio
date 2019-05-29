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

end
