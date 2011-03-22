RSpec.configure do |c|
  c.exclusion_filter = {
    :ruby => lambda {|version|
      !(RUBY_VERSION.to_s =~ /^#{version.to_s}/)
    }
  }
end

describe "something" do
  it "does something (ruby 1.8)", :ruby => 1.8 do
    # ....
  end
  it "does something (ruby 1.9)", :ruby => 1.9 do
    # ....
  end
end