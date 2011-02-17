require 'spec_helper'

describe "relationships/index.html.erb" do
  before(:each) do
    assign(:relationships, [
      stub_model(Relationship,
        :client_id => 1,
        :prospect_id => 1,
        :info => "Info"
      ),
      stub_model(Relationship,
        :client_id => 1,
        :prospect_id => 1,
        :info => "Info"
      )
    ])
  end

  it "renders a list of relationships" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Info".to_s, :count => 2
  end
end
