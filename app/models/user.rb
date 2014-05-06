class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def star
    equity_star = 'fa-star'
    emc_star = 'fa-star-half-o'
    non_star = 'fa-star-o'
    if self.equity == "Equity"
      return equity_star
    elsif self.equity == "EMC"
      return emc_star
    else
      return non_star
    end
  end

end
