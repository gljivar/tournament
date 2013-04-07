require 'spec_helper'

describe "countries/edit" do
  before(:each) do
    @country = assign(:country, stub_model(Country,
      :name => "MyString",
      :code3 => "MyString"
    ))
  end

  it "renders the edit country form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => countries_path(@country), :method => "post" do
      assert_select "input#country_name", :name => "country[name]"
      assert_select "input#country_code3", :name => "country[code3]"
    end
  end
end
