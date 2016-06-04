# TinnyRobot

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/tinny_robot`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tinny_robot'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tinny_robot

## Usage

Install gem and execute or go inside the main gem directory and execute the tinny_robot file in exe directory.

Valid commands  
-> PLACE X, Y, FACE
  FACE must any of: NORTH, SOUTH, EAST, WEST
  X and Y must be positive integers
-> MOVE
-> LEFT
-> RIGHT
-> EXIT

Example execution
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|

> move
The first action must be place the toy
-> PLACE X,Y,FACE
> place
 Invalid command, use:
  -> PLACE X, Y, FACE
  FACE must any of: NORTH, SOUTH, EAST, WEST
  X and Y must be positive integers
> place 1 2 west
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|__|<_|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|

> move
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|<_|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|

> right
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|^_|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|

> left
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|<_|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|

> left
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|v_|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|

> move
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|v_|__|__|__|__|
|__|__|__|__|__|

> move
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|v_|__|__|__|__|

> move
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|v_|__|__|__|__|
Invalid position 0, -1
> report
_______________
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|__|__|__|__|__|
|v_|__|__|__|__|

0, 0, SOUTH

> exit


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/tinny_robot. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
