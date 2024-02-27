class Age
  class << self
    def from(date)
      ((Time.zone.now - date.to_time) / 1.year.seconds).floor
    end
  end
end
