require "exiftool"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      sorted = photos.sort_by { |photo|
        (Exiftool.new(photo.path)[:date_time_original] ?
        Exiftool.new(photo.path)[:date_time_original] :
        photo.modified_time.to_s)
      }
      sorted.reverse
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)