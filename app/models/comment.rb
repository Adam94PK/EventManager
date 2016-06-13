class Comment < ActiveRecord::Base
  validates :comment, presence: true, length: { maximum: 500, too_long: '%{count} characters is the maximum allowed' }

  belongs_to :event
  belongs_to :user
end
