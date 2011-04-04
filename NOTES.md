## Principles

* Single Responsibility Principle

## Code smells

* Temporary Variable
* Long Method
* Large Class
* Mixing abstractions (e.g. passing some variables as params and using instance variables for others - p. 105)

## Refactoring techniques

* Extract Method
* Extract Class (remedy for SRP and Large Class)

## Ruby skills

inject iterator (p. 102):

    (0..3).inject(0) do |count, index|
      count + (exact_match?(guess, index) ? 1 : 0)
    end

`yield self` idiom for helper methods:

    describe Thing do
      def given_thing_with(options)
        yield Thing.new do |thing|
          thing.set_status(options[:status])
        end
      end

      it "should do something when ok" do
        given_thing_with(:status => 'ok') do |thing|
          thing.do_fancy_stuff(1, true, :move => 'left', :obstacles => nil)
          ...
        end
      end

      it "should do something else when not so good" do
        given_thing_with(:status => 'not so good') do |thing|
          thing.do_fancy_stuff(1, true, :move => 'left', :obstacles => nil)
          ...
        end
      end
    end

## Testing techniques

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

Exploratory Testing

> Exploratory testing is a practice in which we discover the behavior of an application by interacting with it directly. It is the opposite of the process we’ve been learning about, in that we’re looking to see what the app actually does and then question whether that is the correct behavior.

> Perhaps you’re wondering why we’d want to do exploratory testing if we’ve already tested the app. Well, we haven’t. Remember that BDD is a design practice, not a testing practice. We’re using executable exam- ples of how we want the application to behave. But just as Big Design Up Front fails to allow for discovery of features and designs that nat- urally emerge through iterative development, driving out behavior with examples fails to unearth all of the corner cases that we’ll naturally discover by simply using the software.

> As you’re doing this, flaws will appear for a variety of reasons. Per- haps there are missing scenarios or code examples. Some flaws may stem from naive design choices. The reasons for these flaws are not important. What is important is that the investment we’ve made to get this far has been very, very small compared to an exhaustive up-front requirements-gathering process. An interactive session with working software is worth a thousand meetings.

*Testing results (from end of Chapter 8)*

* Too few characters
* No warning on too many characters
* No error on non-numeric characters
* Duplicate numbers are still scored
* Non UTF-8 characters are ok
* No way to quit

## Console test drivers

Use `at_exit` to print something to STDOUT on exit:

    at_exit { puts "\n***\nThe secret code was: #{secret_code}\n***" }

## Using RSpec for documentation

    $ rspec spec --format documentation

## Use stub_chain to stub long Rails fluent statements:

To test this:

    Article.recent.published.authored_by(params[:author_id])

Use a `stub_chain`:

    article = double()
    Article.stub_chain(:recent, :published, :authored_by).and_return(article)

## Expected arguments

Look for a hash argument with at least some key-value pairs:

    mock_account.should_receive(:add_payment_accounts).
      with(hash_including('Electric' => '123', 'Gas' => '234'))

## Add autotest support

Create an 'autotest' subdirectory in the project root

Add a `discover.rb` file in the 'autotest' directory with:

    Autotest.add_discovery { "rspec2" }

Add 'autotest' gems to your Gemfile:

    gem "autotest"
    gem "autotest-fsevent"
    gem "autotest-growl"

Install gems:

    $ bundle

Create a '~/.autotest' file with:

    require 'autotest/growl'
    require 'autotest/fsevent'

Run autotest from your project root:

    $ autotest

## Use Cucumber steps within step definitions:

Sugar-free:

    When /I transfer (.*) from (.*) to (.*)/ do |amount, source, target|
      When "I select #{source} as the source account"
      When "I select #{target} as the target account"
      When "I set #{amount} as the amount"
      When "I click transfer"
    end

Or with some sugar:

    When /I transfer (.*) from (.*) to (.*)/ do |amount, source, target|
      steps %Q{
        When I select #{source} as the source account
        And I select #{target} as the target account
        And I set #{amount} as the amount
        And I click transfer
      }
    end

## Quick tips

### Don't use !=

Prefer:

    "something_else".should_not == "something"

Instead of:

    "something_else".should != "something"

### Testing changes

In Rails, test that statements change:

    expect {
      User.create!(:role => "admin")
    }.to change{ User.admins.count }

Or to test that they change `from`, `by` or `to` a specific number:

    expect {
      User.create!(:role => "admin")
    }.to change{ User.admins.count }.by(1)

    expect {
      User.create!(:role => "admin")
    }.to change{ User.admins.count }.to(1)

    expect {
      User.create!(:role => "admin")
    }.to change{ User.admins.count }.from(0).to(1)

### Use subjects to describe an object

Refer to the defined subject as `subject` in your expectations:

    describe Person do
      subject { Person.new(:birthdate => 19.years.ago) }
      specify { subject.should be_eligible_to_vote }
    end

Or use an implicit subject and `should` will delegate to the `subject`:

    describe Person do
      subject { Person.new(:birthdate => 19.years.ago) }
      it { should be_eligible_to_vote }
    end

If you don't need any arguments, the `describe` statement can be used as the subject (this asserts that `Person.new.happy?` is `true`):

    describe Person do
      it { should be_happy }
    end

### Cucumber profiles

Set up profiles in `cucumber.yml` to easily run different feature sets. For example, define a 'wip' profile:

    wip: --tags @wip features

And execute it by:

    $ cucumber -p wip

## Questions

What's the difference between `stub` and `mock`? (p. 197)

When would the `description` be used in a custom matcher? (p. 242)