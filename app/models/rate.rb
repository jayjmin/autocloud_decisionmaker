class Rate < ActiveRecord::Base
  belongs_to :resourceset
  belongs_to :servicetype
  belongs_to :operatingsystem
  belongs_to :geo
  has_many :rateelems
  has_one :provider, :through => :resourceset

  attr_accessible :resourceset_id, :servicetype_id, :operatingsystem_id, :geo_id

  attr_accessor :price, :hours
  @price = 0
  @hours = 0

  def jcloudname
    return Jcloudname.where("provider_id = ? AND geo_id = ?", provider, geo).first
  end

  def show
    "#{resourceset.show} : #{servicetype.show} : #{operatingsystem.show} : #{geo.show}"
  end

  def export_jcloud params
    jname = jcloudname
    if params[:forceonce] == "true"
      f_st = 1
    else
      f_st = 0
    end
    nummachine = params[:nummachine]

    if resourceset.iscustomizable == true
      rsrc_jcloud = "#{resourceset.cpu},#{resourceset.ram},#{resourceset.hdd}"
    else
      rsrc_jcloud = resourceset.name
    end
    "#{jcloudname.providername}:#{rsrc_jcloud}:#{jcloudname.locationname}:#{params[:os_name]},#{params[:os_version]},#{params[:os_64bit]}:#{nummachine}:#{f_st}"
  end

  def calc_price hours, numcpu=0, numram=0, numhdd=0
    @hours = hours.to_f
    @price = 0

    rateelems.each do |elem|
      timesnum = 1.0
      if resourceset.iscustomizable == true
        case elem.item
        when "cpu"
          resourceset.cpu = numcpu
          timesnum = numcpu.to_f
        when "ram"
          resourceset.ram = numram
          timesnum = numram.to_f
        when "hdd"
          resourceset.hdd = numhdd
          timesnum = numhdd.to_f
        else
          puts "calc_price ERROR!! Customizable, but item is not specified!"
        end
      end
      @price += timesnum * elem.price_period* (hours.to_f/elem.period_hour).ceil
    end
    @price = (@price*100).round / 100.0
  end
end
