require "jekyll-minimagick"

module Jekyll
  module JekyllMinimagick
    class GeneratedImageFile < Jekyll::StaticFile
      def initialize(site, base, dir, name, preset)
        @site = site
        @base = base
        @dir  = dir
        @name = name
        @dst_dir = preset.delete('destination')
        @src_dir = preset.delete('source')
        @commands = preset
        
        # jekyll-minimagick is missing these two instance variables
        @relative_path = File.join(*[@dir, @name].compact)
        @extname = File.extname(@name)
      end
    end
  end
end