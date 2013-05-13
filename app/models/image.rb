class Image < ActiveRecord::Base
  belongs_to :provider
  belongs_to :operatingsystem
  attr_accessible :imgid
end
