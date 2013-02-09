__This gem is currently under construction and isn't quite ready for production use, please check back later for updates.__


# Will Toggle

This gem is intended to clean up RoR views for jQuery toggling between hidden and visible elements.

```ruby
  <%= will_toggle 'Change Your Password', 'users/password_fields', checked: false, locals { f: f } %>
```

Just like that, you now have a `check_box_tag` that will display the `password_fields` partial when checked, and hide it from view when unchecked.  This becomes very handy in complex forms when you want to hide certain fields from a user until they actively enable a feature.


### How does it work?

A `check_box_tag` is added with the `label_tag` Change Your Password.  The checkbox is wired in to the `onchange` event, which triggers a jQuery function to toggle a will-toggle-wrapper that encapsulates the partial.

__Currently will\_toggle only supports a checkbox toggle, however, you can expect many more implementations to come.__


## Installation

Add this line to your application's Gemfile:

    gem 'will_toggle'

And then execute:

    $ bundle install

Or, install it yourself as:

    $ gem install will_toggle


## Usage

A minimalist:
```ruby
  <%= will_toggle 'Change Your Password', 'users/password_fields', locals { f: f } %>
```


### Available options:

  - label: the string you will use to describe the toggled div, i.e. show details.
  - checked: true or false, defaults to false. Specifies whether the checkbox will be checked.
  - locals: a hash of necessary variables for your partial.
  - clear\_data: true or false, defaults to false. If true, the toggle function will clear any values in any child `text_field` upon toggle. Especially useful for optional form fields.
  
All the bells and whistles:
```ruby
  <%= will_toggle 'Add Your Twitter Account', partial: 'users/fields/twitter', checked: false, clear_data: true, locals: { f: f } %>
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Acknowledgements

This gem is inspired by [will\_paginate](www.github.com/mislav/will_paginate)
