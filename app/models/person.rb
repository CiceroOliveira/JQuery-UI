class Person < ActiveRecord::Base
  attr_accessible :name, :email, :info
  
  validates :name, :presence => true
  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false }
                    
  has_many :relationships, :foreign_key => 'client_id',
                           :dependent => :destroy
  has_many :supportees, :through => :relationships, :source => :prospect
  
  has_many :reverse_relationships, :foreign_key => 'prospect_id',
                                   :class_name => 'Relationship',
                                   :dependent => :destroy
  has_many :supporters, :through => :reverse_relationships, :source => :client
  
  def supporting?(prospect)
    relationships.find_by_prospect_id(prospect)
  end
  
  def support!(prospect)
    relationships.create!(:prospect_id => prospect.id)
  end
    
end
