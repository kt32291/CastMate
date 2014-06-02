class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :roles, through: :jobs
  has_many :submissions
  has_many :auditions, through: :submissions

  mount_uploader :headshot, HeadshotUploader

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

  # def self.search(search)

  #   if search
  #     if Role.find_by(id: search)
  #       where(self.roles.where(id: search))
  #     end
  #   end

  # end

end
