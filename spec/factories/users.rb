FactoryBot.define do
  factory :user do
    sequence :remote_id do |n|
      n
    end
    first_name { "MyString" }
    image_url { "https://sampleimage.com/my.jpg" }
  end
end
