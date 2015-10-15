class Thoughtrecord < ActiveRecord::Base
  belongs_to :creator, foreign_key: :user_id, class_name: 'User'

  validates_presence_of :situation

  PER_PAGE = 5

  default_scope { order('created_at DESC') }

end