require "exifr"

module Jekyll
  module PhotoFilter
    def photo_filter(files)
      photos = files.select {|photo| photo.relative_path.include?("original") }
      sorted = photos.sort_by { |photo| photo.modified_time }
      sorted.each do |photo|
        EXIFR::JPEG.new(photo.path).date_time.to_s
      end.reverse
    end
  end
end
Liquid::Template.register_filter(Jekyll::PhotoFilter)