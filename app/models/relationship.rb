class Relationship < ActiveRecord::Base
  attr_accessible :prospect_id, :info
  
  belongs_to :client, :class_name => "Person"
  belongs_to :prospect, :class_name => "Person"
  
  validates :client_id, :presence => true
  validates :prospect_id, :presence => true
end
