class LocationsController < InheritedResources::Base
  def show
    @location = Location.find(params[:id])
    @json = @location.to_gmaps4rails
  end
  
  def index
    @locations = Location.all
    @json = @locations.to_gmaps4rails
  end
end
