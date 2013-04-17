require 'spec_helper'

describe "fields/index" do
  before(:each) do
    assign(:fields, [
      stub_model(Field,
        :name => "Name",
        :competition => nil
      ),
      stub_model(Field,
        :name => "Name",
        :competition => nil
      )
    ])
  end

  it "renders a list of fields" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
