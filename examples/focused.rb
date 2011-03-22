RSpec.configure do |c|
  c.filter = { :focus => true }
end

describe "group" do
  it "example 1", :focus => true do
  end

  it "example 2" do
  end
end