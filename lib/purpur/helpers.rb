module Purpur
  module Helpers

    def icon_tag(name, options = {})
      size = Purpur::ICON_SIZES[options.delete(:size)]
      styleclass = ['icon', options.delete(:class)].join(' ')

      content_tag(:span, {class: styleclass, data: { icon: Purpur.icon_name(name), 'icon-size' => size }}.deep_merge(options)) do
        content_tag(:span, class: 'icon--wrapper') do
          content_tag(:svg, class: 'icon--cnt') do
            content_tag('use', nil, 'xlink:href' => "#{asset_url('purpur.svg')}##{name}-icon", 'x' => 0, 'y' => 0)
          end
        end
      end
    end

  end
end
