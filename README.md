# Alfredo
[![Build Status](https://travis-ci.org/Springest/alfredo.png?branch=master)](https://travis-ci.org/Springest/alfredo)

Alfredo is wrapper for Alfred 2's new Workflow system. It generates a
XML response based on the information in the [Alfred
Forums](http://www.alfredforum.com/topic/5-generating-feedback-in-workflows/).

## Installation

    $ gem install alfredo

## Usage

Using Alfredo is pretty straightforward:

```ruby
require 'alfredo'

# set up the workflow
workflow = Alfredo::Workflow.new

# you can add as many items as you want like this:
workflow << Alfredo::Item.new(...)

# At the end of your script call:
workflow.output!
```

Parameters available for `Alfredo::Item.new` are:

* `title` (shown in large text in the results)
* `subtitle` (shown under the title in smaller text)
* `arg` (argument that can be passed on to next steps in the workflow)
* `uid` (value that Alfred uses to learn about your usage)
* `icon_path` (path of icon or file, relative to workflow directory)
* `icon_type`
  *  `fileicon` (uses the icon associated with a file)
  *  `filetype` (uses the icon associated with the type of a file)
* `type` (when `file` allows result action for files)

More info is available at the [Alfred
Forums](http://www.alfredforum.com/topic/5-generating-feedback-in-workflows/).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
