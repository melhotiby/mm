require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :address => "MyString",
      :about_me => "MyText"
    ))
  end

  it "renders the edit profile form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => profiles_path(@profile), :method => "post" do
      assert_select "input#profile_address", :name => "profile[address]"
      assert_select "textarea#profile_about_me", :name => "profile[about_me]"
    end
  end
end
