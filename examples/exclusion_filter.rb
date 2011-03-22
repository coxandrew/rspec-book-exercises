RSpec.configure do |c|
  c.exclusion_filter = { :slow => true }
end

describe "group" do
  it "example 1", :slow => true do
  end

  it "example 2" do
  end
end