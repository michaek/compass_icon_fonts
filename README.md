# Compass Icon Fonts

Simple helpers for common icon font sets.

## History

I was using the [font-icons](https://github.com/krisbulman/font-icons) Compass plugin, but I was unhappy about three things:

1. I felt that a Compass plugin shouldn't try to distribute font files, and legally can't distribute non-free fonts.
2. I don't think support for icons should come with indelible or hard-to-change default styling.
3. It was non-trivial to stay up-to-date with new font versions.

## Approach

In this plugin, I'm not distributing font files. Part of the process of setting up your project will be to download the fonts. That's easy, so I don't expect you'll mind.

By default, only a small amount of padding is applied to icons that are prepended or appended. Any other styles can be applied by modifying placeholder selector blocks before invoking compass-icon-fonts-set().

Each font face configured in this plugin has configuration for regenerating a standard font data file (see: stylesheets/icon-fonts) from a canonical list of keynames and unicode characters. This way, we can keep our fonts up to date, and implement multiple icon fonts with a consistent API in SASS.

In the future, I foresee that font support will be moved into specific dependent plugins, like compass-icon-fonts-entypo, to ease versioning and keep this gem uncluttered. For now, any supported font is included here.

## Install

    # If you're using Bundler, add the gem to your Gemfile
    gem 'compass-font-icons'
    # Then install
    $ bundle install

    # Or install it manually
    $ gem install compass-font-icons

    # Add the following lines to your compass configuration file:
    require 'compass_font_icons'

## Use

    # Import the specific font you'll be using.
    @import "icon-fonts/entypo";

    # Add the font family. Any of the variables from the font data 
    # can be overridden before this line.
    @include compass-icon-fonts-family;

    # Add the actual icons. Any variables or placeholder selectors
    # can be overridden before this line.
    @include compass-icon-fonts-set;

The CSS generated by default can be pretty heavy. The best way to keep things small is to pass in a list of icon keynames instead of using all.

    @include compass-icon-fonts-set(heart star);

