require 'open-uri'

class PostsImportJob < ApplicationJob
  queue_as :default

  def perform(*args)
    
    url = "https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles.json"

    begin
      data = JSON.parse(open(url).read)
    rescue OpenURI::HTTPError
      # TODO: This should track the failure and if X number of failures are hit in a set period
      #       then it should reports to an admin.
      return
    end

    return unless data.kind_of?(Array)

    # Reduce the users down to a collectio of unique users
    users = data.reduce([]) { |result, item|  
      !item["user"].present? || result.include?(item["user"]) ?  result : result << item["user"] 
    } 

    # Create / Update each user in this data feed (assuming the latest information is the newest)
    users.each do |u|
      user = User.where(remote_id: u["id"]).first_or_initialize
      user.first_name = u["first_name"]
      user.image_url = u["current_avatar"]["large"]
      
      # TODO: What is a save fails, log to bugsnag?
      user.save
    end

    data.each do |p|
      next unless p["id"].present?

      post = Post.where(remote_id: p["id"]).first_or_initialize
      post.title = p["title"]
      post.description = p["description"]
      post.image_url = p["photos"][0]["files"]["large"]
      post.user = User.find_by_remote_id(p["user"]["id"])
      post.expires_at = p["expiry"]
      post.remote_like_count = p["reactions"]["likes"]

      # TODO: What is a save fails, log to bugsnag?
      post.save

    end

    return data
  end
end
