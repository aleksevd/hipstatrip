class Comment < ActiveRecord::Base
  attr_accessible :owner_id, :owner_type, :text

  belongs_to :owner, polymorphic: true
  belongs_to :user

  validates :text, presence: true, length: { maximum: 250 }
end
