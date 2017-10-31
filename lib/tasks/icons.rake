require "purpur"
require "purpur/generator"
require "uglifier"
require 'csso'


namespace :purpur do

  desc "Generate SVG icons sprite"
  task :process => [:normalize_filenames] do
    generator = Purpur::Generator.new
    generator.generate("purpur.svg", Purpur.sprite_file)
  end

  desc "Normalize filenames"
  task :normalize_filenames do
    Purpur.icons.each do |old_name|
      next unless old_name.include?('_')

      new_name = File.join Purpur.images_dir, old_name.gsub('_', '-')
      old_name = File.join Purpur.images_dir, old_name

      File.delete(new_name) if File.exists?(new_name)
      File.rename(old_name, new_name)
    end
  end

  desc "Optimize SVG"
  task :optimize do
    system "svgo -f #{Purpur.images_dir} --disable=mergePaths"
  end

end
