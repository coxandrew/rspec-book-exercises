class RSpecGreeter
  def greet
    "Hello RSpec!"
  end
end

describe "RSpec Greeter" do
  it "should say 'Hello RSpec!' when it receives the greet() message" do
    greeter = RSpecGreeter.new
    greeting = greeter.greet
    greeting.should == "Hello RSpec!"
  end

  it "says 'Hello [something]'" do
    greeter = RSpecGreeter.new
    greeting = greeter.greet
    greeting.should match /^Hello [a-zA-Z]+/
  end
end