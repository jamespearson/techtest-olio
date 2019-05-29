class Post < ApplicationRecord

    include RemoteId
    include ImageUrl
    
    validates   :description,   presence: true

    validates   :expires_at,    presence: true

    validates   :title,         presence: true
    
    validates   :user,          presence: true

    belongs_to :user

end
