module ApplicationHelper
  def dollar_format(value)
    if value.present?
      return "$%.2f" % value
    end
    "$%.2f" % 0.0
  end

  def dollars(value)
    if value.blank? || value == 0
      return 0
    end
    value.to_s[0, value.to_s.index(".")]
  end

  def to_hours_and_mins_s(value)
    if (value / 60) == 0
      (value % 60).to_s + " minutes"
    else
      (value / 60).to_s + " hours, " + (value % 60).to_s + " minutes"
    end
  end
end
