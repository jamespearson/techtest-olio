FactoryBot.define do
  factory :post do
    sequence :remote_id do |n|
      n
    end
    title { "MyString" }
    description { "MyString" }
    collection_notes { "MyString" }
    status { "active" }
    listed_at { 1.day.ago}
    expires_at { 1.week.since }
    remote_like_count { 1 }
    image_url { "https://sampleimage.com/my.jpg" }
    user
  end
end
