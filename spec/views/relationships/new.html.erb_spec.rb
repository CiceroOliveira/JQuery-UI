require 'spec_helper'

describe "relationships/new.html.erb" do
  before(:each) do
    assign(:relationship, stub_model(Relationship,
      :client_id => 1,
      :prospect_id => 1,
      :info => "MyString"
    ).as_new_record)
  end

  it "renders new relationship form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => relationships_path, :method => "post" do
      assert_select "input#relationship_client_id", :name => "relationship[client_id]"
      assert_select "input#relationship_prospect_id", :name => "relationship[prospect_id]"
      assert_select "input#relationship_info", :name => "relationship[info]"
    end
  end
end
