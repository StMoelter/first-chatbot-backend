class IntentProcessorFactory
  def initialize(type)
    @type = type
  end

  def klass
    IntentProcessor::GlobalSearch
  end

end