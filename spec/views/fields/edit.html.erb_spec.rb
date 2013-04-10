require 'spec_helper'

describe "fields/edit" do
  before(:each) do
    @field = assign(:field, stub_model(Field,
      :name => "MyString",
      :competition => nil
    ))
  end

  it "renders the edit field form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fields_path(@field), :method => "post" do
      assert_select "input#field_name", :name => "field[name]"
      assert_select "input#field_competition", :name => "field[competition]"
    end
  end
end
