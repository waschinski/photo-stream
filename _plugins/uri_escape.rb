require "erb"
include ERB::Util

module Jekyll
  module URIEscape
    def uri_escape(text)
      url_encode(text).gsub("+", "%20") if !text.nil?
    end
  end
end
Liquid::Template.register_filter(Jekyll::URIEscape)