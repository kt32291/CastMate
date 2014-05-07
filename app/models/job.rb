class Job < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  belongs_to :theatre
end
