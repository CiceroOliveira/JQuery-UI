require 'spec_helper'

describe Relationship do
  before :each do
    @client = Factory(:person)
    @prospect = Factory(:person, :email => Factory.next(:email))
    
    @relationship = @client.relationships.build(:prospect_id => @prospect.id)
  end
  
  it 'should create a new instance given valid attributes' do
    @relationship.save!
  end
  
  describe 'follow methods' do
    
    before :each do
      @relationship.save
    end
    
    it 'should have a client attribute' do
      @relationship.should respond_to(:client)
    end
    
    it 'should have the right client' do
      @relationship.client.should == @client
    end
    
    it 'should have a prospect attribute' do
      @relationship.should respond_to(:prospect)
    end
    
    it 'should have the right prospect user' do
      @relationship.prospect.should == @prospect
    end
  end
  
  describe 'validations' do
    
    it 'should require a client_id' do
      @relationship.client_id = nil
      @relationship.should_not be_valid
    end
    
    it 'should require a prospect_id' do
      @relationship.prospect_id = nil
      @relationship.should_not be_valid
    end
    
  end
end
