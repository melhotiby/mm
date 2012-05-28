require 'spec_helper'

describe User do
   it { should have_many(:notifications) }
   it { should have_many(:relationships) }
   it { should have_many(:reverse_relationships) }
   it { should have_many(:followed_users).through(:relationships) }
   it { should have_many(:followers).through(:reverse_relationships) }

   include_context 'default_user_roles'
   let (:user) { Factory(:user) }

	it "return false if the email is not correct" do 
    user.email = "not_valid_email2.com"
	  user.should_not be_valid
	end

	it "verify the latitude and longitude" do
    user.city = "Orlando"
    user.state = "FL"
    user.latitude.should eq  28.5383355
		user.longitude.should eq -81.3792365
    # with({:first_name => "something", :last_name => "else"})
  end

  before do
    # FactoryGirl.create(:user, :email => "other@yahoo.com", :city => "Orlando", :state => "Fl")
  end

  # it { other_user.latitude == 28.5383355 }
  # it { other_user.longitude == -81.3792365 }


end