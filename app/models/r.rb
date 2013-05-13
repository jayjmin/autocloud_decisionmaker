class Rate < ActiveRecord::Base
  belongs_to :resourceset
  belongs_to :servicetype
  belongs_to :operatingsystem
  belongs_to :geo
  has_one :provider, :through => :resourceset

  attr_accessible :rate_hour, :rate_month, :rate_once, :resourceset_id, :servicetype_id, :operatingsystem_id, :geo_id

  validates :rate_hour, :rate_month, :rate_once, :presence => true

  attr_accessor :price
  @price = 0

  def hours_to_month hours
    ((hours+1).to_f/24/30).ceil
  end

  def calc_price hours
    @price = rate_once
    @price += rate_hour * hours

    if rate_month != nil
      @price += hours_to_month(hours) * rate_month
    end
  end

  def calc_price_custom hours, cpu, ram, hdd
    @price = rate_once
  end
end
