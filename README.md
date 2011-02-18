## Quickstart

Use the 'go' script to open this project in Textmate as well as The RSpec Book's PDF in Preview.

    $ go rspec
    GO GO GADGET rspec!!
    Using /Users/cox/.rvm/gems/ruby-1.9.2-p136 with gemset rspec

## Environment setup

Make sure you have the proper gemset. Copy .rvmrc.example to .rvmrc and create the gemset, for example:

    $ rvm use 1.9.2@rspec --create

Install the gems required for the book's exercises with Bundler:

    $ bundle install

### Picking up where you left off

If you've been reading the book's PDF recently, it should just open to the right place (if you've set "Start on the last page viewed" in Preview's preferences).

Otherwise, it's a good idea to create a bookmark in Preview when you're done reading for the session.

If you can't remember what you did last, you can refresh your memory by looking at your recent git commits. You *are* making small and frequent commits to git, right?

    $ git log

### Running tests

Each mini-project should have its own subdirectory with RSpec or Cucumber tests. For a basic project, you should be able to run tests with:

RSpec (runs all examples in spec directory):

    $ rspec spec

Cucumber (runs all features in features directory):

    $ cucumber

### Running spork

*Note: this is not working yet (trouble with LOAD_PATH)*

Install the prerelease version (for Rails 3+). In your Gemfile:

    gem 'spork', '~> 0.9.0.rc'

Install spork and bootstrap your project with spork directives:

    $ bundle install
    $ spork --bootstrap

Follow the instructions written to `spec_helper`

## Things I've learned

### Principles

* Single Responsibility Principle

### Code smells

* Temporary Variable
* Long Method
* Large Class
* Mixing abstractions (e.g. passing variables from method to method, but using instance variables for others - p. 105)

### Refactoring techniques

* Extract Method
* Extract Class (remedy for SRP and Large Class)

### Ruby skills

inject iterator (p. 102):

    (0..3).inject(0) do |count, index|
      count + (exact_match?(guess, index) ? 1 : 0)
    end

### Testing techniques

Use RSpec output as Class documentation:

    $ rspec spec/codebreaker/marker_spec.rb --format nested
    Codebreaker::Marker
      #exact_match_count
        with no matches
          returns 0
        with 1 exact match
          returns 1
        with 1 number match
          returns 0
        with 1 exact match and 1 number match
          returns 1
      #number_match_count
        with no matches
          returns 0
        with 1 number match
          returns 1
        with 1 exact match
          returns 0
        with 1 exact match and 1 number match
          returns 1

    Finished in 0.00461 seconds
    8 examples, 0 failures

