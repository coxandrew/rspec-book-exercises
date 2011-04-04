RSpec::Matchers.define :report_to do |boss|
  match do |employee|
    employee.reports_to?(boss)
  end

  failure_message_for_should do |employee|
    "expected the team run by #{boss} to include #{employee}"
  end

  failure_message_for_should_not do |employee|
    "expected the team run by #{boss} to exclude #{employee}"
  end

  # This is used when you don't supply a string to the "it" method
  description do
    "be a member of the team run by #{boss}"
  end
end

class Employee
  def initialize(name, manager = nil)
    @name    = name
    @manager = manager
  end

  def reports_to?(manager)
    (manager == @manager) ? true : false
  end

  def to_s
    @name
  end
end

describe "employee" do
  it "reports to Phil" do
    manager  = Employee.new("Phil")
    employee = Employee.new("Andrew", manager)

    employee.should report_to(manager)
  end
end