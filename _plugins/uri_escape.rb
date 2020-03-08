require "uri"

module Jekyll
  module URIEscape
    def uri_escape(text)
      URI.escape(text) if !text.nil?
    end
  end
end
Liquid::Template.register_filter(Jekyll::URIEscape)