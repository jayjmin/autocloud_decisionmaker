module DecisionHelper
  def format_day day
    day = day.to_i
    str = ""
    if day >= 365
      str += "#{day/365} Years "
      day = day % 365
    end

    if day >= 30
      str += "#{day/30} Months "
      day = day % 30
    end

    if day > 0
      str += "#{day} Days "
    end

    if str == ""
      str = "None"
    end
    return str
  end

  def format_hour hour
    hour = hour.to_i
    str = ""
    if hour >= 24
      str = format_day hour/24
      hour = hour % 24
    end
    if hour > 0
      str = "#{hour} Hours "
    end
    if str == ""
      str = "None"
    end
    return str
  end
end
