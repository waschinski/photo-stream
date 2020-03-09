module Jekyll
  module DestroyOriginals
    def self.init(site)
      @JEKYLL_CONFIG = site.config
    end

    def self.jekyll_config
      @JEKYLL_CONFIG || Jekyll.configuration({})
    end

    def self.destroy
      directories = jekyll_config["image_processing"].each_with_object([]) do |(size, size_options), array|
        directory = File.join(jekyll_config["destination"], size_options["source"])
        if directory != jekyll_config["destination"]
          array.push(directory)
        end
      end
      directories.each do |directory|
        FileUtils.rm_f(Dir.glob("#{directory}/*.jp*g"))
      end
    end
  end
end

Jekyll::Hooks.register :site, :after_reset do |jekyll|
  Jekyll::DestroyOriginals.init(jekyll)
end

Jekyll::Hooks.register :site, :post_write do |page|
  Jekyll::DestroyOriginals.destroy
end
