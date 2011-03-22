describe "something", :a => "A" do
  it "does something", :b => "B" do
    p example.metadata[:a]
    p example.metadata[:b]
  end
end