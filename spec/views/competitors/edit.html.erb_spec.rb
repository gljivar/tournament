require 'spec_helper'

describe "competitors/edit" do
  before(:each) do
    @competitor = assign(:competitor, stub_model(Competitor,
      :first_name => "MyString",
      :last_name => "MyString",
      :category => nil,
      :club => nil
    ))
  end

  it "renders the edit competitor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => competitors_path(@competitor), :method => "post" do
      assert_select "input#competitor_first_name", :name => "competitor[first_name]"
      assert_select "input#competitor_last_name", :name => "competitor[last_name]"
      assert_select "input#competitor_category", :name => "competitor[category]"
      assert_select "input#competitor_club", :name => "competitor[club]"
    end
  end
end
