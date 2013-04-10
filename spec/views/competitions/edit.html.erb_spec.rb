require 'spec_helper'

describe "competitions/edit" do
  before(:each) do
    @competition = assign(:competition, stub_model(Competition,
      :name => "MyString"
    ))
  end

  it "renders the edit competition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => competitions_path(@competition), :method => "post" do
      assert_select "input#competition_name", :name => "competition[name]"
    end
  end
end
