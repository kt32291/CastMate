class Audition < ActiveRecord::Base
  belongs_to :theatre
  belongs_to :play
  has_many :submissions
  has_many :users, through: :submissions

  def equity_type
    if self.equity == true
      return "Equity"
    else
      return "Non-Equity"
    end
  end

  def star
    equity_star = 'fa-star'
    non_star = 'fa-star-o'
    if self.equity == true
      return equity_star
    else
      return non_star
    end
  end

end
