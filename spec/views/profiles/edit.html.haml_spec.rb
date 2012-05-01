require 'spec_helper'

describe "profiles/edit" do
  before(:each) do
    @profile = assign(:profile, stub_model(Profile,
      :address => "MyString",
      :about_me => "MyText"
    ))
  end
end
