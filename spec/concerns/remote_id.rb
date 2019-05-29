require 'spec_helper'

shared_examples_for "has_remote_id" do

    let(:model) { described_class }

    it("should be required") do
      should validate_presence_of(:remote_id)
    end

    it("should be unique") do
      should validate_uniqueness_of(:remote_id)
    end

end