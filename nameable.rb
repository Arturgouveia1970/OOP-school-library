class Nameable
  def correct_name(name)
    raise NotImplementError, "#{self.class} has not implemented method '#{__method__}'"
  end
end