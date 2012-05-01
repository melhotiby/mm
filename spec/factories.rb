# FactoryGirl.define.sequence(:email) {|n| "person#{n}@example.com" }
# FactoryGirl.define.sequence(:company_name) {|n| "company#{n}" }

# Factory.define :role do |r|
#   r.name {"Admin"}
# end
# 
# Factory.define :role_user do |ru|
#   ru.association(:role)
#   ru.association(:user)
# end
# 
# Factory.define :user do |u|
#   u.first_name {"matt"}
#   u.last_name {"jones"}
#   # u.email {'matt_elhotiby@muzak.com'}
#   # u.password {"English12"}
#   u.company {FactoryGirl.create(:muzak_company)}
# end
# 
# Factory.define :company do |c|
#   c.name {Factory.next(:company_name)}
# end
# 
# Factory.define :mood_media_company, class: Company do |c|
#   c.name {"Mood Media"}
# end
# 
# Factory.define :muzak_company, class: Company do |c|
#   c.name {"muzak"}
# end