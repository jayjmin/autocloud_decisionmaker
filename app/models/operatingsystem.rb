class Operatingsystem < ActiveRecord::Base
  attr_accessible :name

  has_many :rates
  has_many :providers, :through => :rates, :uniq => true

  def show
    "OS = #{name}"
  end
end
