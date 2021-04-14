module ActiveSupport
  class TimeWithZone
    def as_json(_options = {})
      strftime('%Y-%m-%d %H:%M %p')
    end
  end
end
