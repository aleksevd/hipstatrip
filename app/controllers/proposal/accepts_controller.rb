class Proposal::AcceptsController < InheritedResources::Base
  actions :create

  def create
    create! { @accept.trip }
  end

protected

  def build_resource
    @accept = Proposal::Accept.new(params.slice(:proposal_id))
  end
end
