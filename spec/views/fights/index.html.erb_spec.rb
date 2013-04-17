require 'spec_helper'

describe "fights/index" do
  before(:each) do
    assign(:fights, [
      stub_model(Fight),
      stub_model(Fight)
    ])
  end

  it "renders a list of fights" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
