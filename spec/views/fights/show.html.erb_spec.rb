require 'spec_helper'

describe "fights/show" do
  before(:each) do
    @fight = assign(:fight, stub_model(Fight))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
