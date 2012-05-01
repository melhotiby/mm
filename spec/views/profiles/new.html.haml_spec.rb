require 'spec_helper'

describe "profiles/new" do
  before(:each) do
    assign(:profile, stub_model(Profile,
      :address => "MyString",
      :about_me => "MyText"
    ).as_new_record)
  end
end
