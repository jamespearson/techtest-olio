FactoryBot.define do
  factory :post do
    remote_id { 1 }
    title { "MyString" }
    description { "MyString" }
    collection_notes { "MyString" }
    status { 1 }
    expires_at { "2019-05-29 11:21:16" }
    remote_like_count { 1 }
    image_url { "MyString" }
  end
end
