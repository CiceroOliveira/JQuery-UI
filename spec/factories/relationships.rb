# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :relationship do
      client_id 1
      prospect_id 1
      info "MyString"
    end
end