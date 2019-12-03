module ApplicationHelper
  def dollar_format(value)
    if value.present?
      return "$%.2f" % value
    end
    "$%.2f" % 0.0
  end
end
