# Plugin found at https://github.com/nataliastanko/jekyll-lightgallery-exif - thanks Natalia!

#frozen_string_literal: true

require 'exiftool'

module Jekyll
  module ExifData
    module ExifDataFilter

      # Read exif/xmp using exiftool
      #
      # file - relative path to the file
      # exiftag -  title, decription, file_size, create_date, megapixels, ...
      def exif(file, exiftag)
        exiftag = exiftag.to_sym
        filepath = File.expand_path(File.dirname(File.dirname(__FILE__))) + '/' + file

        begin
          if File.exist?(filepath)
            e = Exiftool.new(filepath)
            e.to_hash.key?(exiftag)
            e[exiftag]
          end

        rescue StandardError => e  
          puts e.message 
          file
        end
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExifData::ExifDataFilter)
