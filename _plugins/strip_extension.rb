module Jekyll
  module StripExtension
    def strip_extension(text)
      File.basename(text, ".*")
    end
  end
end
Liquid::Template.register_filter(Jekyll::StripExtension)