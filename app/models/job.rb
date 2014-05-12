class Job < ActiveRecord::Base
  belongs_to :role
  belongs_to :user
  belongs_to :theatre

  # def play
  #   self.role.play
  # end

  # def play_title
  #   self.play.try(:title)
  # end

  # def play_title=(title)
  #   self.play = Play.find_or_create_by_title(title) if title.present?
  # end

end
