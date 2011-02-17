namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    make_users
    make_relationships
  end
end

def make_users
  10.times do |n|
    name = "Client #{n+1}"
    email = "user-#{n+1}@example.com"
    info = "Info about user-#{n+1}"
    Person.create!(:name => name,
                   :email => email,
                   :info => info)
  end
end

def make_relationships
  users = Person.all
  user = users.first
  prospects = users[2..10]
  prospects.each do |prospect|
    info = "Info regarding the relationship between client #{user.name} and prospect client #{prospect.name}"
    user.relationships.create!(:client_id => user.id,
                              :prospect_id => prospect.id,
                              :info => info)
  end
end