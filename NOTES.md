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
