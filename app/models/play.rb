class Play < ActiveRecord::Base
  has_many :roles
  has_many :auditions
end
