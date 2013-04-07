require 'spec_helper'

describe "countries/index" do
  before(:each) do
    assign(:countries, [
      stub_model(Country,
        :name => "Name",
        :code3 => "Code3"
      ),
      stub_model(Country,
        :name => "Name",
        :code3 => "Code3"
      )
    ])
  end

  it "renders a list of countries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Code3".to_s, :count => 2
  end
end
