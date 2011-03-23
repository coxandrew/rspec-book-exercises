RSpec::Matchers.define :report_to do |boss|
  match do |employee|
    employee.reports_to?(boss)
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
end

describe "employee" do
  it "reports to Phil" do
    manager  = Employee.new("Phil")
    employee = Employee.new("Andrew", manager)
    employee.should report_to(manager)
  end
end