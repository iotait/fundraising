module ApplicationHelper
  def dollar_format(value)
    if value.present?
      return "$%.2f" % value
    end
    "$%.2f" % 0.0
  end

  def to_hours_and_mins_s(value)
    (value / 60).to_s + " hours, " + (value % 60).to_s + " minutes"
  end
end
