class Proposal < ActiveRecord::Base
  belongs_to :sender, class_name: :User
  belongs_to :receiver, class_name: :User
  belongs_to :trip
  has_many :comments, as: :owner

  validates_presence_of :sender
  validates_presence_of :receiver
  validates_presence_of :trip

  def accept!
    update_column :state, 1
  end

  def cancel!
    update_column :state, 2
  end
end
