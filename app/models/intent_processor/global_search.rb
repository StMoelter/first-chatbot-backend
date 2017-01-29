require 'wikipedia'

class IntentProcessor::GlobalSearch
  def self.process(entities)
    entry = Wikipedia.find(Array.wrap(entities[:global_word]).join(' '))
    entry.summary
  end
end