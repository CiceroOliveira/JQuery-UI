require 'spec_helper'

describe Person do
  
  before (:each) do
    @attr = { :name => 'Example User', 
              :email => 'user@example.com',
              :info => 'Info about the example user,' }
  end
  
  it 'should create a new instance given valid attributes' do
    Person.create!(@attr)
  end
  
  it 'should require a name' do
    no_name_person = Person.new(@attr.merge(:name => ""))
    no_name_person.should_not be_valid
  end
  
  it 'should require an email address' do
    no_email_person = Person.new(@attr.merge(:email => ""))
    no_email_person.should_not be_valid
  end
  
  it 'should reject duplicate email addresses' do
    upcased_email = @attr[:email].upcase
    Person.create!(@attr.merge(:email => upcased_email))
    person_with_duplicate_email = Person.new(@attr)
    person_with_duplicate_email.should_not be_valid
  end
  
  describe 'relationships' do
    before :each do
      @user = Person.create!(@attr)
      @prospect = Factory(:person)
    end
    
    it 'should have a relationships method' do
      @user.should respond_to(:relationships)
    end
    
    it 'should have a supporter' do
      @user.should respond_to(:supportees)
    end
    
    it 'should have a supporting? method' do
      @user.should respond_to(:supporting?)
    end
    
    it 'should have a support! method' do
      @user.should respond_to(:support!)
    end
    
    it 'should support another user' do
      @user.support!(@prospect)
      @user.should be_supporting(@prospect)
    end
    
    it 'should include the supportees user in the supporting array' do
      @user.support!(@prospect)
      @user.supportees.should include(@prospect)
    end
    
    it 'should have a reverse_relationship method' do
      @user.should respond_to(:reverse_relationships)
    end
    
    it 'should have a supporters method' do
      @user.should respond_to(:supporters)
    end
    
    it 'should include the supporter in the supporters array' do
      @user.support!(@prospect)
      @prospect.supporters.should include(@user)
    end
    
  end
end
