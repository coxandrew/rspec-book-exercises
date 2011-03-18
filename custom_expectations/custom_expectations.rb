class GreaterThanMatcher
  def initialize(expected)
    @expected = expected
  end

  def description
    "a number greater than #{@expected}"
  end

  def ==(actual)
    actual > 3
  end
end

def greater_than(floor)
  GreaterThanMatcher.new(floor)
end

class Calculator
  def initialize
    @sum = 0
  end

  def add(num)
    @sum += num
  end
end

describe Calculator do
  it "adds a value greater than three" do
    should_receive(:add).with(greater_than(3))
    add(4)
  end
end