module ImageUrl
    extend ActiveSupport::Concern
  
    included do

        # TODO: This is only checking for a valid url.
        #       Ideally it would check for an image at that url by either testing the file extention
        #       or testing the respone of the URL.
        validates   :image_url,     presence: true,
                                    format: URI::regexp(%w[http https])

    end
  
  end