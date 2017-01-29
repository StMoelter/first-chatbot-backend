module IntentProcessor
  class Time
    def self.process(_entities = nil)
      I18n.l(::Time.now.in_time_zone('Berlin'), format: :date_time_long)
    end
  end
end
