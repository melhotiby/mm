require 'spec_helper'

describe User do
   it { should have_many(:notifications) }
   it { should have_many(:relationships) }
   it { should have_many(:reverse_relationships) }
   it { should have_many(:followed_users).through(:relationships) }
   it { should have_many(:followers).through(:reverse_relationships) }
end
