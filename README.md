TextMarker
===========

Gem that mark string in a text. It is possible mark the text with html tags.

Installation
============

Gemfile
-------

1) add in your Gemfile

    gem 'text-marker'

2) run this line in your prompt

    $ bundle install text-marker


RubyGems
-------

    $ gem install text-marker

Usage
=====

    require 'text-marker'

    tm = TextMarker.new "Text"
    tm_tag1 = TextMarker::Tag.new :tag, :background_color, :text_color

    text_with_all_ocurrence_of_snipped_marked = tm.mark_all_ocurrence_of(
      "snippet-to-be-marked", tm_tag1)

    text_with_all_ocurrences_of_snipped_marked = tm.mark_all_ocurrence_of(
      "snippet-to-be-marked", TextMarker::Tag.new :span)

    text_with_first_ocurrence_of_snipped_marked = tm.mark_first_ocurrence_of(
      "snippet-to-be-marked", TextMarker::Tag.new :span, :yellow)

Author
======

#### Created and maintained by
Geison Felipe Goes Flores
geisonfgf@gmail.com
@geisonfgfg

License
=======

TextMarker is licensed under the MIT license.

See LICENSE for the full license text.
