class Proposal < ActiveRecord::Base
  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User

  validates_presence_of :sender
  validates_presence_of :receiver
end
