require 'spec_helper'

describe "competitors/show" do
  before(:each) do
    @competitor = assign(:competitor, stub_model(Competitor,
      :first_name => "First Name",
      :last_name => "Last Name",
      :category => nil,
      :club => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
