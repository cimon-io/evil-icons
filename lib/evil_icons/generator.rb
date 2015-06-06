require "nokogiri"
require "erb"
require "evil_icons"

module EvilIcons

  class Generator
    def initialize(svg_path)
      @svg_path       = svg_path
      @templates_dir  = File.expand_path('../../templates', __FILE__)
    end

    def files
      EvilIcons::ICON_NAMES
    end

    def read_svg(filename)
      file = File.join(@svg_path, filename)
      File.read(file)
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
        name        = File.basename(name, EvilIcons::ICON_EXTENTION)

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
