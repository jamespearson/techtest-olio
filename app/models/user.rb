class User < ApplicationRecord

    include RemoteId
    include ImageUrl
    
    validates   :first_name,    presence: true

    has_many :posts
    
end
