module ApplicationHelper
  def dollar_format(value)
    "$%.2f" % value
  end
end
