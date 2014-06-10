class Callsheet < ActiveRecord::Base
  # validates_uniqueness_of :audition_id, :scope => :user_id
  belongs_to :user
  belongs_to :audition

  # def user
  #   User.find_by(id: self.audition_id)
  # end
end
