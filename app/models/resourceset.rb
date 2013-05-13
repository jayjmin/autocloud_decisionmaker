class Resourceset < ActiveRecord::Base
  attr_accessible :cpu, :hdd, :iscustomizable, :name, :ram, :provider_id

  belongs_to :provider
  has_many :rates

  def show
    "#{provider.name} - #{name} (CPU=#{cpu}, RAM=#{ram}, HDD=#{hdd})"
  end
end
