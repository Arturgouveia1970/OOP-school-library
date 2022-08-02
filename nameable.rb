class Nameable
  def correct_name(*)
    raise NotImplementError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
