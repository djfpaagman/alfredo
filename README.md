# Alfredo

Alfredo is wrapper for Alfred 2's new Workflow system. It generates a
XML response based on the work of
[alfred2-top-workflow](https://github.com/zhaocai/alfred2-top-workflow/tree/master/top).
I'm pretty sure Alfredo is not feature complete, so pull requests that
fix or add features will be appreciated. 

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

* ``title``
* `subtitle`
* `arg` (argument that can be passed on to next steps in the workflow)
* `uid`
* `icon_path` (path of icon, relative to workflow directory)
* `icon_type`
* `type`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
