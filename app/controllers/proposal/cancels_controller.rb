class Proposal::CancelsController < InheritedResources::Base
  actions :create

  def create
    create! { @cancel.trip }
  end

protected

  def build_resource
    @cancel = Proposal::Cancel.new(params.slice(:proposal_id))
  end
end
