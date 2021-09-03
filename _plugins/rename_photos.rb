module Jekyll
  module RenamePhotos
    def self.jekyll_config
      Jekyll.configuration({})
    end
  
    def self.rename
      directory = jekyll_config["image_processing"]["large"]["source"]
      Dir.glob("#{directory}/*.[jJ][pP]*[gG]").each do |filename|
        file = File.new(filename)
        dir = File.dirname(file.path)
        name = File.basename(file.path, ".*")
        ext = File.extname(file.path).downcase
        newname = File.join(dir, "#{name}#{ext}")
        File.rename(file.path, newname)
       end
    end
  end
end
  
Jekyll::Hooks.register :site, :after_reset do
  Jekyll::RenamePhotos.rename
end
