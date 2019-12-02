module ApplicationHelper
  def dollar_format(value)
    unless value.blank?
      return "$%.2f" % value
    end
    "$%.2f" % 0.0
  end
end
