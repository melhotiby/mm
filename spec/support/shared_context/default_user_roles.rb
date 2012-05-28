shared_context 'default_user_roles' do
  before(:all) do
    # Kazumlabs::UserRoles.create_defaults!
  end

  after(:all) do
    # Role.where(:name => Role::DEFAULT_ROLES).destroy_all
  end
end