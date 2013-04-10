require 'spec_helper'

describe "competitions/index" do
  before(:each) do
    assign(:competitions, [
      stub_model(Competition,
        :name => "Name"
      ),
      stub_model(Competition,
        :name => "Name"
      )
    ])
  end

  it "renders a list of competitions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
