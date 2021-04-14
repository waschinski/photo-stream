require "cgi"

module Jekyll
  module URIEscape
    def uri_escape(text)
      CGI.escape(text) if !text.nil?
    end
  end
end
Liquid::Template.register_filter(Jekyll::URIEscape)