class SearchesController < InheritedResources::Base
  def show
    @search = Search.new(params[:search])
  end
end
