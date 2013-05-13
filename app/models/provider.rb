class Provider < ActiveRecord::Base
  attr_accessible :name

  has_many :resourcesets
  has_many :rates, :through => :resourcesets
  has_many :geos, :through => :rates, :uniq => true
end
