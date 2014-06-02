class Submission < ActiveRecord::Base
  validates_uniqueness_of :audition_id, :scope => :user_id
  belongs_to :user
  belongs_to :audition
end
