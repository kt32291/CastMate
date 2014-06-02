class Audition < ActiveRecord::Base
  belongs_to :theatre
  belongs_to :play
  has_many :submissions
  has_many :users, through: :submissions

end
