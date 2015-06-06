Free ‘plug and play’ set of SVG icons designed specifically for web projects. Available as a Ruby gem. Just use icon names with your templates and styles — and all the rest will be done automagically.

'EvilIcons' originaly made by [Alexander Madyankin] and [Roman Shamin].

[Alexander Madyankin]:  https://twitter.com/outpunk
[Roman Shamin]:         https://twitter.com/romanshamin

## Usage

* [Supported browsers](#supported-browsers)
* [Grunt](#grunt)
* [Gulp](#gulp)
* [CDN](#cdn)
* [Rails](#rails)
* [Sinatra](#sinatra)
* [npm](#npm)
* [React](#react)
* [Styling](#styling)

### Supported browsers
We support IE 9+, Firefox, Chrome, Safari (desktop and mobile), Opera, Android 4+.
http://caniuse.com/#search=inline%20svg

### Using with rails

Add the `'evil_icons'` gem to your Gemfile:
```ruby
gem 'evil_icons', github: 'cimon-io/evil-icons'
```

Add the Evil Icons require to your `application.css`:
```css
/*
 *= require evil-icons
 */
```

Next, you have to place all svg-icons inside `app/assets/icons` folder and generate `sprite.svg` file:

```console
bin/rake evil_icons:process
```

Finally, you can render the icon using the `icon_tag` helper.
Here are some examples:
```erb
<%= icon_tag 'search' %>
<%= icon_tag 'arrow-right', size: :m %>
<%= icon_tag 'envelope', size: :l, class: "custom-class" %>
```

## Roadmap
* Implement possibility to use ourside rails.
* Allow to set animated icons inside icons
* Describe algorithm to create cvg icons
* Implement responsive icons
