require "nokogiri"
require "erb"
require "purpur"

module Purpur

  class Generator
    def initialize
      @templates_dir  = File.expand_path('../../templates', __FILE__)
    end

    def files
      Purpur.icons
    end

    def read_svg(filename)
      File.read(filename)
    end

    def icons
      files.map do |name|
        file        = read_svg(name)
        doc         = Nokogiri::HTML::DocumentFragment.parse(file)

        doc.css('*').remove_attr('fill')

        svg         = doc.at_css('svg')
        viewbox     = svg['viewbox']
        g           = svg.search('g')
        container   = g.empty? ? svg : g

        shape       = container.children.map {|c| c.to_s}.join('')
        name        = File.basename(name, Purpur::ICON_EXTENTION)

        { name: name, viewbox: viewbox, shape: shape }
      end
    end

    def optimize(code, template)
      template == 'sprite.svg' ? code.gsub(/$\s+/, '') : code
    end

    def sprite(template)
      view    = File.read File.join(@templates_dir, "#{template}.erb")
      result  = ERB.new(view).result(binding)
      optimize(result, template)
    end

    def generate(template, destination_path)
      file = File.new(destination_path, 'w')
      file.write sprite(template)
      file.close
    end

  end

end
