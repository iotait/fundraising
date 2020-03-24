class String
  def numeric?
    !!(self =~ /^-?\d+(\.\d*)?$/)
  end
end
