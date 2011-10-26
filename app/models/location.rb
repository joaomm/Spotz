class Location < ActiveRecord::Base
  validates_presence_of :name
  
  acts_as_gmappable :check_process => :prevent_geocoding,
                    :address => "address", :normalized_address => "address",
                    :msg => "Sorry, not even Google could figure out where that is"

  def prevent_geocoding
    address.blank? || (!latitude.blank? && !longitude.blank?) 
  end
end
