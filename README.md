# PurPur

Free ‘plug and play’ set of SVG icons designed specifically for web projects. Available as a Ruby gem. Just use icon names with your templates and styles — and all the rest will be done automagically.

The 'purpur' gem originaly based on '[EvilIcons](https://github.com/outpunk/evil-icons/)'.

### Supported browsers
We support IE 11+, Firefox, Chrome, Safari (desktop and mobile), Opera, Android 4+.

### Using with rails

Add the `'purpur'` gem to your Gemfile:
```ruby
gem 'purpur'
```

This gem is under deep development, so we would reccomend to use master branch:
```ruby
gem 'purpur', github: 'cimon-io/purpur'
```


Add the purpur icons require to your `application.css`:
```css
/*
 *= require purpur
 */
```

Next, you have to place all svg-icons inside `app/assets/icons` folder and generate `purpur.svg` file:

```console
bin/rake purpur:process
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
