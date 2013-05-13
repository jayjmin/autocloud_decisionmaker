class Geo < ActiveRecord::Base
  attr_accessible :city, :continent

  has_many :rates
  has_many :providers, :through => :rates, :uniq => true
  def show
    "#{city}, #{continent}"
  end
end
