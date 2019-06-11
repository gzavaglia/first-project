# POKEMON-no-GO
## First Project with Flatiron

This is my  first project with Flatiron school. This program is supposed to be simpler, uglier version of any Pokemon game. 
Once you have the program up and running, you'll be presented a four options:
1. Catch! and you'll will catch a Pokemon
2. Show all - here you can choose to see all the Pokemon that are available for you to catch and their information. 
3. Pokedex - Here you'll be able to see which Pokemon you caught
4. Exit the program.

Choose wisely and please be gentle.

## Installation
### Prerequisites 
You should first clone the project to your computer by running 

``` git clone git@github.com:gzavaglia/first-project.git ``` 

Before you run the app, make sure you install Bundler by typing in the command line: 

```
bundle install
```
## Play 

This project is coded using Ruby, so make sure you have the latest version installed. 
After Bundler is installed you can 'cd' into the first-project folder and run the app to play with it by typing

``` bin/run ``` 

## Usage

The program uses the website [RANKEDBOOST](https://rankedboost.com/pokemon-go/) to collect all the information. The first level of information is comming from it's Pokedex option (where we get the name and url), and the second level goes into each specific information of each Pokemon. 

Anytime you catch a new Pokemon, you'll have the option to see its details and/or see your Pokedex. 

## Running the tests

In order to make sure everything works, type each option as prompted to see how everything works in an "ideal world". To test what would happened if a word is misspelled, type anything else; you should be prompted to select an option again if no word matches any on the list. Try all the options in any of the menus. If a word is not utilized, you should expect to see the menu being prompted again in order for you to type the write word. Do as you can to break it! I tried to make sure I accounted for any possibility.  

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/run` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'gzavaglia'/first-project. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the First::Project project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'gzavaglia'/first-project/blob/master/CODE_OF_CONDUCT.md).
