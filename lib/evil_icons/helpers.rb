module EvilIcons
  module Helpers

    def icons_sprite
      html_safe File.new(EvilIcons.sprite_file).read
    end

    def icon_tag(name, options = {})
      size = EvilIcons::ICON_SIZES[options.delete(:size)]
      styleclass = ['icon', options.delete(:class)].join(' ')

      content_tag(:span, {class: styleclass, data: { icon: icon_name(name), 'icon-size' => size }}.deep_merge(options)) do
        content_tag(:span, class: 'icon--wrapper' do
          content_tag(:svg, class: 'icon--cnt') do
            content_tag('use', 'xlink:href' => "##{name}-icon")
          end
        end
      end
    end

    def icon_name(key)
      name = EvilIcons.icon_name(icon_key(key))
      logger.warn "No icon '#{key}' in `#{ICON_PATH}`" if name.nil?
      name || key
    end

  end
end
