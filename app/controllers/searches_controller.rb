class SearchesController < InheritedResources::Base
  def show
    @search = Search.new(params[:search])
    @trips = @search.trips.page(params[:page])
  end
end
