class Jcloudname < ActiveRecord::Base
  belongs_to :provider
  belongs_to :geo
  attr_accessible :locationname, :providername, :provider_id, :geo_id
end
