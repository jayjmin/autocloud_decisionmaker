class Servicetype < ActiveRecord::Base
  attr_accessible :contract_day, :isflexiblefee, :isstable, :stype

  def show
    "#{stype} (#{contract_day} days)"
  end
end
