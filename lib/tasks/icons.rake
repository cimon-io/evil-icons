require "evil_icons"
require "evil_icons/generator"
require "uglifier"
require 'csso'


namespace :evil_icons do

  desc "Generate SVG icons sprite"
  task :process => [:normalize_filenames, :optimize] do
    generator = EvilIcons::Generator.new(EvilIcons.images_dir)
    generator.generate("sprite.svg")
  end

  desc "Normalize filenames"
  task :normalize_filenames do
    binding.pry

    filenames = Dir.entries(EvilIcons.images_dir).select { |f| File.extname(f) == '.svg' }

    filenames.each do |old_name|
      next unless old_name.include?('_')

      new_name = File.join EvilIcons.images_dir, old_name.gsub('_', '-')
      old_name = File.join EvilIcons.images_dir, old_name

      File.delete(new_name) if File.exists?(new_name)
      File.rename(old_name, new_name)
    end
  end

  desc "Optimize SVG"
  task :optimize do
    system "svgo -f #{EvilIcons.images_dir} --disable=mergePaths"
  end

end
