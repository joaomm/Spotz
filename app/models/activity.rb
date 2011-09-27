class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :act
  belongs_to :location
  
  validates_presence_of :user, :act, :location
end
