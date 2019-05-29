class Post < ApplicationRecord

    include RemoteId

    validates   :description,   presence: true

    validates   :expires_at,    presence: true

  

    validates   :title,         presence: true
    
    
end
