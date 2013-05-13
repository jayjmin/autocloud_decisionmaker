class DecisionController < ApplicationController
  def find
    find_rates params
    @nummachine = params[:nummachine].to_i
    @forceonce = false
    if(params[:forceonce] != nil && params[:forceonce] == "true")
      @forceonce = true
    end

    respond_to do |format|
      format.html
      format.json { render json: @rates }
    end
  end
  def convert_days days, months=0, years=0
    return days.to_i + months.to_i*30 + years.to_i*365
  end
  def convert_hours hours, days=0, months=0, years=0
    return hours.to_i + convert_days(days, months, years)*24
  end

  def find_rates par
    uloc = par[:location]
    uos = par[:os]
    usvc = {:isspot => par[:isspot], :contract => convert_days(par[:contract], par[:contract_month], par[:contract_year])}
    uhours = convert_hours(par[:hours], par[:hours_day], par[:hours_month], par[:hours_year])

    ureq = {:os => uos, 
            :location => uloc, 
            :service => usvc, 
            :rsrc => par, 
            :hours => uhours}
    
    @rates = get_rate ureq
  end

  def get_resource ureq
    if ureq[:rsrc] != nil
      rsrcs = Resourceset.where "cpu >= :mincpu AND ram >= :minram AND hdd >= :minhdd", ureq[:rsrc]
    else
      rsrcs = Resourceset.all
    end
  end

  def get_os ureq
    if ureq[:os] == nil
      os = Operatingsystem.all
    else
      if ureq[:os][:operatingsystem_id] != nil && ureq[:os][:operatingsystem_id] != ""
        os = Operatingsystem.find ureq[:os][:operatingsystem_id]
      elsif ureq[:os][:name] != nil && ureq[:os][:name] != ""
        os = Operatingsystem.where "name = :name", ureq[:os]
      else
        os = Operatingsystem.all
      end
    end
  end

  def get_location ureq
    if ureq[:location] == nil
      location = Geo.all
    else
      if ureq[:location][:geo_id] != nil && ureq[:location][:geo_id] != ""
        location = Geo.find(ureq[:location][:geo_id])
      elsif ureq[:location][:city] != nil
        location = Geo.where "city = :city", ureq[:location]
      elsif ureq[:location][:continent] != nil
        location = Geo.where "continent = :continent", ureq[:location]
      else
        location = Geo.all
      end
    end
  end

  def get_service ureq
    if ureq[:service][:isspot] == "true"
      service = Servicetype.where "isstable = 'f'"
    elsif ureq[:service][:contract] != nil
      service = Servicetype.where "isstable = 't' AND contract_day <= :contract", ureq[:service]
    else
      service = Servicetype.all
    end
  end

  def get_rate ureq
    rsrcs = get_resource ureq
    os = get_os ureq
    locations = get_location ureq
    services = get_service ureq
    
    rates = Rate.where "resourceset_id IN (?) AND operatingsystem_id IN (?) AND geo_id IN (?) AND servicetype_id IN (?)", rsrcs, os, locations, services

    calc_price rates, ureq[:hours], ureq[:rsrc]
  end

  def calc_price rates, hours, rsrc
    if rsrc == nil
      rates.each do |rate|
        rate.calc_price(hours)
      end
    else
      rates.each do |rate|
        rate.calc_price(hours, rsrc[:mincpu], rsrc[:minram], rsrc[:minhdd])
      end
    end
    rates.sort_by { |rate| rate.price }
  end

  def test
    #uloc = {:city => "Sydney"}
    #ursrc = {:mincpu =>1, :minram => 1000, :minhdd => 40}
    uos = nil
    usvc = {:isspot => false, :contract => 0}
    uhours = 24*30

    ureq = {:os => uos, :location => uloc, :service => usvc, :rsrc => ursrc, :hours => uhours}
    
    @rates = get_rate ureq
  end

end
