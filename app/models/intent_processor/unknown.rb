module IntentProcessor
  class Unknown
    def self.process(entities)
      "Entschuldigung, das habe ich nicht verstanden #{entities.to_s}"
    end
  end
end
