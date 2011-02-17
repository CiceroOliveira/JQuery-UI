require 'spec_helper'

describe "relationships/show.html.erb" do
  before(:each) do
    @relationship = assign(:relationship, stub_model(Relationship,
      :client_id => 1,
      :prospect_id => 1,
      :info => "Info"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Info/)
  end
end
