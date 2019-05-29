require 'rails_helper'
require Rails.root.join("spec/concerns/remote_id.rb")
require Rails.root.join("spec/concerns/image_url.rb")

RSpec.describe User, type: :model do
  
  it_behaves_like "has_image_url"
  it_behaves_like "has_remote_id"
  
  it "should require a first name" do
    should validate_presence_of(:first_name)
  end

end
