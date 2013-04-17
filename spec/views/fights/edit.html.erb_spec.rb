require 'spec_helper'

describe "fights/edit" do
  before(:each) do
    @fight = assign(:fight, stub_model(Fight))
  end

  it "renders the edit fight form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fights_path(@fight), :method => "post" do
    end
  end
end
