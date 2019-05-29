module RemoteId
    extend ActiveSupport::Concern
  
    included do

        validates   :remote_id,     presence: true,
                                    uniqueness: true

    end
  
  end