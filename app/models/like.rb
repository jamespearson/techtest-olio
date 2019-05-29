class Like < ApplicationRecord

  validates :post,  presence: true

  belongs_to :post, counter_cache: true
end
