class SearchesController < InheritedResources::Base
  def show
    @search = Search.new
    @trip = Trip.new # FIXME replace with search
  end
end
