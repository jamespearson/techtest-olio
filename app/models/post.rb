class Post < ApplicationRecord

    include RemoteId
    include ImageUrl
    
    enum status: {
         active: 0,
         deleted: -1
    }

    validates   :description,   presence: true

    validates   :expires_at,    presence: true

    validates   :listed_at,     presence: true

    validates   :title,         presence: true
    
    validates   :user,          presence: true

    belongs_to :user

    has_many :likes, dependent: :destroy

    def total_likes
        likes_count + remote_like_count
    end
    
end
