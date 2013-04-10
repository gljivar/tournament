require 'spec_helper'

describe "fights/new" do
  before(:each) do
    assign(:fight, stub_model(Fight).as_new_record)
  end

  it "renders new fight form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => fights_path, :method => "post" do
    end
  end
end
