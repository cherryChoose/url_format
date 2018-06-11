module UrlFormat
  module ModelAdditions
    def format_url(attribute)
      before_validation do
      	# self.website = self.class.format_url(website)
        send("#{attribute}=", UrlFormat.format_url(send(attribute)))
      end
      validates_format_of attribute, with: UrlFormat.url_regexp, multiline: true , message: "is not a valid URL"
    end
  end
end
