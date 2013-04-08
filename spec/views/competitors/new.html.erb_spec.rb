require 'spec_helper'

describe "competitors/new" do
  before(:each) do
    assign(:competitor, stub_model(Competitor,
      :first_name => "MyString",
      :last_name => "MyString",
      :category => nil,
      :club => nil
    ).as_new_record)
  end

  it "renders new competitor form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => competitors_path, :method => "post" do
      assert_select "input#competitor_first_name", :name => "competitor[first_name]"
      assert_select "input#competitor_last_name", :name => "competitor[last_name]"
      assert_select "input#competitor_category", :name => "competitor[category]"
      assert_select "input#competitor_club", :name => "competitor[club]"
    end
  end
end
