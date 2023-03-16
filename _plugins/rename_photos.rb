module Jekyll
  module RenamePhotos
    def self.init(site)
      @JEKYLL_CONFIG = site.config
    end

    def self.jekyll_config
      @JEKYLL_CONFIG || Jekyll.configuration({})
    end
  
    def self.rename
      directory = jekyll_config["image_processing"]["large"]["source"]
      Dir.glob("#{directory}/*").each do |filename|
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

Jekyll::Hooks.register :site, :after_init do |jekyll|
  Jekyll::RenamePhotos.init(jekyll)
end
  
Jekyll::Hooks.register :site, :after_reset do
  Jekyll::RenamePhotos.rename
end
