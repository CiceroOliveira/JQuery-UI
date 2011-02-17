# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :person do
      email "client_uno@example.com"
      name "Client number uno"
      info "Information about the first client."
    end
  
  sequence :email do |n|
    "person-#{n}@example.com"
  end
end