require 'spec_helper'

describe "competitors/index" do
  before(:each) do
    assign(:competitors, [
      stub_model(Competitor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :category => nil,
        :club => nil
      ),
      stub_model(Competitor,
        :first_name => "First Name",
        :last_name => "Last Name",
        :category => nil,
        :club => nil
      )
    ])
  end

  it "renders a list of competitors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
