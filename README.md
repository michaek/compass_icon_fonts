# Compass Icon Fonts

Simple helpers for common icon font sets.

## Fonts

Currently just Entypo...

## History

I was using the [font-icons](https://github.com/krisbulman/font-icons) Compass plugin, but I was unhappy about three things:

1. I felt that a Compass plugin shouldn't try to distribute font files, and legally can't distribute non-free fonts.
2. I don't think support for icons should come with indelible or hard-to-change default styling.
3. It was non-trivial to stay up-to-date with new font versions.

## Approach

In this plugin, I'm not distributing font files. Part of the process of setting up your project will be to download the fonts. That's easy, so I don't expect you'll mind.

By default, only font-size and font-family are applied to the icons. Any other styles can be applied by modifying placeholder selector blocks before invoking compass-icon-fonts-set().

Each font face configured in this plugin has configuration for regenerating a standard font data file (see: stylesheets/compass-icon-fonts/) from a canonical list of keynames and unicode characters. This way, we can keep our fonts up to date, and implement multiple icon fonts with a consistent API in SASS.

In the future, I foresee that font support will be moved into specific dependent plugins, like compass-icon-fonts-entypo, to ease versioning and keep this gem uncluttered. For now, any supported font is included here.

## Install

Download the font you're using, and put the .woff, .ttf, etc files in your Compass fonts dir.

    # If you're using Bundler, add the gem to your Gemfile
    gem 'compass_icon_fonts'
    # Then install
    $ bundle install

    # Or install it manually
    $ gem install compass_icon_fonts

    # Add the following lines to your compass configuration file:
    require 'compass_icon_fonts'

## Use

    # Import the specific font you'll be using.
    @import "compass-icon-fonts/entypo";

    # Add the font family. Any of the variables from the font data 
    # can be overridden before this line.
    @include compass-icon-fonts-family;

    # Add the actual icons. Any variables or placeholder selectors
    # can be overridden before this line.
    @include compass-icon-fonts-set;

The CSS generated by default can be pretty heavy. The best way to keep things small is to pass in a list of icon keynames instead of using all.

    @include compass-icon-fonts-set(heart star);

## Markup

Observing [icon font best practices](http://pictos.cc/articles/using-icon-fonts/) is recommended. That means that the icon should have its own HTML element with `aria-hidden="true"` to prevent icon characters from being picked up by screen readers. For example:

    <a href="">
      <i aria-hidden="true" class="entypo-paper-plane"></i>
      <span>Cool Link</span>
    </a>

## Contribute

There are two rake tasks that come with compass\_icon\_fonts:

    # Run our tests.
    $ rake spec

    # Build our font data files.
    $ rake build

When we build, I'm using [VCR](https://github.com/vcr/vcr) to avoid hitting remote servers, allowing us to play around with parsing and data file generation without annoying anyone. When we need to get a new version of the server responses, we can use the [:all record mode](https://relishapp.com/vcr/vcr/v/2-4-0/docs/record-modes/all).

Also, if you'd like to contribute a new font, please provide some tests.