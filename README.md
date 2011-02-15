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