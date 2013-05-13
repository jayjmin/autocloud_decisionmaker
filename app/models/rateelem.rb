class Rateelem < ActiveRecord::Base
  belongs_to :rate
  attr_accessible :item, :period_hour, :price_period, :rate_id
end
